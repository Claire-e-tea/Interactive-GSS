
library(shiny)

gss_bi <- read.csv("gss_bi")


# Define UI for application that draws a histogram
ui <- fluidPage(
    
    sidebarPanel(
        selectInput("A",
        label = "Column Variable",
        choices = colnames(gss_bi),
        selected = "grass"
        ),
        selectInput("B",
        label = "Row Variable",
        choices = colnames(gss_bi),
        selected = 
        )
    ),
    
    mainPanel(
        tableOutput("QT")
    )
)


# Define server logic required to draw a histogram


server <- function(input, output) {
    
    t <- reactive({table(gss_bi[[input$A]], gss_bi[[input$B]])})
    pt <- reactive({prop.table(t(), 2)})
    pr <- reactive({round(pt(), 2) * 100})
    output$QT <- renderTable({pr()})
}

# Run the application 
shinyApp(ui = ui, server = server)
