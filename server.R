library(shiny)

dataset_path <- "datasets/datos_ventas_libreria.csv"
stores = sort(unique(data$Tienda))
categories = sort(unique(data$Categoria))

shinyServer(function(input, output) {
  data <- reactive({read.csv(dataset_path)})
  
  output$selectStores <- renderUI({
    selectInput("selectStores", "Seleccione una Tienda:",choices=stores, selected=1)
  })
  
  output$selectCategories <- renderUI({
    selectInput("selectCategories", "Seleccione una categoria:",choices=categories, selected=1)
  })
  
})