library(shiny)

dataset_path <- "datasets/datos_ventas_libreria.csv"
data <- read.csv(dataset_path)
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
  
  output$histAgeRange <- renderPlot({
    hist(data$RangoEdad)
  })
  
  output$filetable <- renderTable({
    data()
  })
  
  output$TotalRegistros <- renderText({
    paste("Total de Registros: ",NROW(data()))
  })
  
  output$TotalVentas <- renderText({
    paste("Total de Ventas: S/.",round(sum(data()$Precio)/1000000,2),"M")
  })
  
  output$HistVentasPrecioLibro <- renderPlot({
    hist(data()$Precio, main="Distribución de ventas por precio de libro", 
         xlab="Precio del libro", col = "dodgerblue",
         ylab="Ventas")
  })
  
  output$HistVentasTienda <- renderPlot({
    barplot(table(data()$Tienda), main="Distribución de ventas por Tienda", 
            xlab="Tienda", col = "firebrick1",
            ylab="Cantidad de ventas")
  })
  
  output$VentasPorGenero <- renderPlot({
    pi<-prop.table(table(data()$Genero))*100
    lbls1 <- paste(names(table(data()$Genero)), "\n",
                   prop.table(table(data()$Genero))*100,"%", sep="")
    pie(pi, labels = lbls1,
        main="Distribución de ventas por genero de cliente")
  })
  
  output$VentasPorEstadoCivil <- renderPlot({
    pi<-prop.table(table(data()$EstadoCivil))*100
    lbls1 <- paste(names(table(data()$EstadoCivil)), "\n",
                   prop.table(table(data()$EstadoCivil))*100,"%", sep="")
    pie(pi, labels = lbls1,
        main="Distribución de ventas por estado civil del cliente")
  })
  
  output$HistVentasEdad <- renderPlot({
    hist(data()$Edad, main="Distribución de ventas por edad del cliente", 
         xlab="Edad del Cliente", col = "darksalmon",
         ylab="Ventas")
  })
  
  output$HistVentasCat <- renderPlot({
    barplot(table(data()$Categoria), main="Distribución de ventas por categoría de libro", 
            xlab="Categoría", col = "darkolivegreen1",
            ylab="Cantidad de ventas")
  })
})