library(RNeo4j)
library(tidyverse)
library(shiny)

graph <- startGraph("http://localhost:7474/db/data/", username="neo4j", password="neo4j")

query <- "MATCH (sop:SOP {is_active:1}) RETURN sop.baseName order by sop.baseName"
activeSOPs <- unlist(cypher(graph, query))
names(activeSOPs) <- activeSOPs