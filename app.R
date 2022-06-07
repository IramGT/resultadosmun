## LIBRARIES

library(dplyr)
library(viridis)
library(readr)
library(utils)
library(raster)
library(shiny)
library(bslib)
library(shinyjs)
library(tidyr)

## DATA BASES IN GOOGLE SHEETS

candidato <- read_csv("https://docs.google.com/spreadsheets/d/e/2PACX-1vRjbG-as7Nz1Zvcuen4nmIkrNHosYf9l8ejfxanTHXG7fkHvQOb3ciUmU5bpUobca2PeY4W2S5SFiBr/pub?gid=723802881&single=true&output=csv")
partido <- read_csv("https://docs.google.com/spreadsheets/d/e/2PACX-1vRQzI276xuBacoA8e2eJCxYArq5MMufjB5rOKR_JWoG16M10eGQ59cOFfd43N0BInPIkNYPYWnIgKh5/pub?gid=723802881&single=true&output=csv")


#### UI ####
ui <- fluidPage(
  theme = bs_theme(version = 4, bootswatch = "simplex"),
  tags$style(type = "text/css", "html, body {width:100%; height:100%} #map{height:80vh !important;}"),
  tabsetPanel(
    tabPanel("Candidato" ,DT::dataTableOutput("ziptable1")),
    tabPanel("Partido",DT::dataTableOutput("ziptable2"))
  ))

#### SERVER ####

server <- function(input, output) {
  
  
  
  output$ziptable1 <- DT::renderDataTable({
    tabla1 <- candidato 
    
    DT::datatable(tabla1, options = list(pageLength = 100))
  })  
  
 
  output$ziptable2 <- DT::renderDataTable({
    tabla2 <- partido
    
    
    DT::datatable(tabla2, options = list(pageLength = 200), escape = FALSE)
  })
}

# Run the application 
shinyApp(ui = ui, server = server)