# Biocrates SOPs
Calculates HPLC solution recipes for the Biocrates kit combining Neo4j and Shiny.

See more about Neo4j here: https://neo4j.com/

See more about Shiny here: https://shiny.rstudio.com/

Relies on https://github.com/nicolewhite/RNeo4j for connecting R to a Neo4j database.


The repository contains the Cypher dump of the database in the [data](data) folder. Just import it into your Neo4 instance and then run the shiny app from the [BiocratesSOPs](BiocratesSOPs) folder.
