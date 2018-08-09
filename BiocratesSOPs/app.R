library(RNeo4j)
library(tidyverse)
library(shiny)


shinyUI(fluidPage(
  
  # Application title
  titlePanel("Biocrates solvent preparation calculator"),
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      selectInput("sop", "SOPs:",
                  activeSOPs),
      uiOutput('solution'),
      uiOutput("vol"),
      actionButton("calc", "Calculate")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      tableOutput('recipe')
    )
  )
))


shinyServer(function(input, output) {
  solutionList <- eventReactive(input$sop, {
    query <- "MATCH (:SOP {baseName:$basename})-[:uses]->(sol) RETURN sol.name order by sol.name"
    activeSols <- unlist(cypher(graph, query, basename=input$sop))
    names(activeSols) <- activeSols
    return(activeSols)
  })
  
  checkRecipe <- function(myIngred) {
    if(all(dim(myIngred %>% filter(!is.na(con.fraction))) == dim(myIngred))) {
      return("fraction")
    }
    return("unit")
  }
  
  volInput <- reactive({
    chkOK <- checkRecipe(ingredients())
    if(chkOK=="fraction") {
      return(c("Volume (mL):","1000"))
    } else {
      return(c("Multiplicative (x)","1"))
    }
  })
  
  ingredients <- eventReactive(input$solution, {
    query <- "MATCH (:solution {name:$name})-[con:contains]->(ingred) 
    RETURN ingred.name, con.fraction, con.unit, con.volume
    order by ingred.name"
    myIngred <- as_tibble(cypher(graph, query, name=input$solution))
  })
  
  recipe <- eventReactive(input$calc, {
    myIngred <- ingredients()
    if(volInput()[1]=="Multiplicative (x)") {
      myIngred <- myIngred %>% mutate(recipe = as.numeric(con.volume) * as.numeric(input$vol))
    } else {
      myIngred <- myIngred %>% mutate(recipe = as.numeric(con.fraction) * as.numeric(input$vol), con.unit="mL")
    }
    myIngred %>% select(ingred.name, recipe, con.unit) %>% rename(ingredient = ingred.name, unit = con.unit)
  })
  
  recipeTitle <- eventReactive(input$calc, {
    vols <- recipe() %>% filter(unit %in% c("L","mL","uL","nL")) %>%
      mutate(recipe = case_when(
        .$unit == "L" ~  .$recipe*1000,
        .$unit == "mL" ~  .$recipe,
        .$unit == "uL" ~  .$recipe/1000,
        .$unit == "nL" ~  .$recipe/1000000,
        TRUE ~ 0 )) %>% summarize(totVol = sum(recipe))
    paste0("<b>Recipe for: ",input$solution, "</b><br>Total volume: ",vols$totVol[1], " mL")
  })
  
  output$solution <- renderUI({
    selectInput('solution', 'solution:', solutionList())
  })
  
  output$vol <- renderUI({
    textInput('vol', volInput()[1], volInput()[2])
  })
  
  observeEvent(input$calc, {
    output$recipe <- renderTable({
      recipe()},
      caption = recipeTitle(),
      caption.placement = getOption("xtable.caption.placement", "top"), 
      caption.width = getOption("xtable.caption.width", NULL)
    )
  })
})