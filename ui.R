library(shiny)
library(ggplot2)
library(datasets)

dataset <- mtcars

shinyUI(fluidPage(

        
        titlePanel("Visualization of the 'mtcars' data set"),
        
        sidebarPanel(
                
                
                sliderInput('sampleSize', 'Sample Size', min=1, max=nrow(dataset),
                            value=max(1, nrow(dataset)), step=1, round=0),
                
                selectInput('x', 'X', names(dataset)),
                selectInput('y', 'Y', names(dataset), names(dataset)[[2]]),
                
                selectInput('facet_col', 'Facet', c(None='.', names(dataset)))                  
                
                
        ),
        
        mainPanel(
               
                plotOutput('plot')
        )
))
