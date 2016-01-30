library(shiny)

shinyServer(
     function(input, output){
     
          output$distPlot <- renderPlot({
               Y<-input$Y
               X<-input$X
               if(X!=Y){
               x    <- iris[, c(X,Y)]  # Old Faithful Geyser data
               #bins <- seq(min(x), max(x), length.out = input$bins + 1)
               
               # draw the histogram with the specified number of bins
               plot(x, col = 'darkgray', pch=19)
               abline(input$intercept, input$slope,lw=2, col="darkred")
               if(input$bestModel){
                    formula<-as.formula(paste0(Y,"~",X))
                    lm<-lm(formula ,data=iris)
                    abline(lm,lw=2, col="darkgreen")    
                    legend("topleft", legend=c("Customer Model","Best Model"), col = c("darkred", "darkgreen"),lty=c(1,1), lwd=c(2,2))
                    output$interceptBEST<-renderPrint({lm$coefficient[1]})
                    output$slopeBEST<-renderPrint({lm$coefficient[2]})
               }else{
                    legend("topleft", legend=c("Customer Model"), col = c("darkred"),lty=c(1), lwd=c(2))
                    output$interceptBEST<-renderPrint({NULL})
                    output$slopeBEST<-renderPrint({NULL})
               }
               output$interceptINT<-renderPrint({input$intercept})
               output$slopeINT<-renderPrint({input$slope})
               output$warnings<-renderPrint({"OK"})
               }else{
                    output$warnings<-renderPrint({"You chose same input variables (X==Y). Select different variables."})
               }
               
          })
              
     }
)