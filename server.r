library(shiny)
library(ggplot2)
library(datasets)

function(input, output) {
        
        dataset <- reactive({
                mtcars[sample(nrow(mtcars), input$sampleSize),]
        })
        
        output$plot <- renderPlot({
                
                
                p <- ggplot(dataset(), aes_string(x=input$x, y=input$y)) + geom_point() + geom_smooth()
                
                facets <- paste('.', '~', input$facet_col)
                if (facets != '. ~ .')
                        p <- p + facet_grid(facets)
                
                
                print(p)
                
        }, height=380)
        
}
