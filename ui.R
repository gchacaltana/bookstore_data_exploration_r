library(shiny)

shinyUI(fluidPage(
  titlePanel("Librerías América"),
  sidebarLayout(
    position = "left",
    sidebarPanel(
      helpText("Las librerías América fueron creadas en 1971; ahora son una de las cadenas de librerías más grandes del país, con más de 34 tiendas a nivel nacional"),
      hr(),
      h3("Información del Dataset"),
      p("El dataset contiene información del perfil de los clientes que realizaron compra de libros durante el año 2018"),
      h3("Estructura del Dataset"),
      tags$ul(
        tags$li(tags$b("Genero: "),"Sexo del Cliente. Hombre ó Mujer"), 
        tags$li(tags$b("Edad: "),"Edad del cliente. Ejem: 25"), 
        tags$li(tags$b("RangoEdad: "),"Grupo Etario. Joven ó Adulto"), 
        tags$li(tags$b("EstadoCivil: "),"Estado civil del cliente. Casado ó Soltero"), 
        tags$li(tags$b("Tienda: "),"Distrito donde se ubica la tienda."), 
        tags$li(tags$b("Categoría: "),"Categoría del libro. Ejem: Literatura"), 
        tags$li(tags$b("Precio: "),"Precio del libro. Ejem: 48.50")
      ),
      hr(),
      h3("Filtros"),
      uiOutput("selectStores"),
      uiOutput("selectCategories")
    ),
    mainPanel(
      img(src = "bookstore.jpg", width="100%"),
      hr(),
      h1("Dashboard de ventas de libros 2018"),
      hr(),
      fluidRow(
        column(6,h2(textOutput("TotalVentas"))),
        column(6,h2(textOutput("TotalRegistros")))
      ),
      hr(),
      fluidRow(
        column(12,plotOutput("HistVentasTienda"))
      ),
      fluidRow(
        column(6,plotOutput("HistVentasPrecioLibro")),
        column(6,plotOutput("HistVentasEdad")),
      ),
      fluidRow(
        column(12,plotOutput("HistVentasCat"))
      ),
      fluidRow(
        column(6,plotOutput("VentasPorEstadoCivil")),
        column(6,plotOutput("VentasPorGenero"))
      )
    )
  )
))