library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(
    disable = TRUE),
  dashboardSidebar(
    width = 190,
    sidebarMenu(
      menuItem("Introducci\u{00F3}n", tabName = "intro", icon = icon("book")),
      menuItem("Sobre el modelo", tabName = "about", icon = icon("star-o")),
      menuItem("Curvas ROC", tabName="roc", icon = icon("star-o")),
      menuItem("Analisis No Param\u{00E9}trico", tabName="nop", icon = icon("book")),
      menuItem("Estimaci\u{00F3}n Param\u{00E9}trica", tabName="para", icon = icon("info")))),
  dashboardBody(
    tags$head(
      tags$style(HTML('.main-header .logo {
                      font-family: "Georgia", Times, "Times New Roman", serif;
                      font-weight: bold;
                      font-size: 24px;}
                      
                      .body{
                      background-color:green;}

                      .js-irs-0 .irs-bar {
                      border-top-color: #000000; border-bottom-color: #000000;} 
                      .js-irs-0 .irs-bar-edge {
                      border-color#000000;}
                      .js-irs-0 .irs-single, .js-irs-0 .irs-bar-edge, .js-irs-0 .irs-bar {
                      background: #AC58FA;}

                      .js-irs-1 .irs-bar {
                      border-top-color: #000000; border-bottom-color: #000000;} 
                      .js-irs-1 .irs-bar-edge {
                      border-color: #000000;}
                      .js-irs-1 .irs-single, .js-irs-1 .irs-bar-edge, .js-irs-1 .irs-bar {
                      background: #9F81F7;}'))),
    tabItems(
      # First tab content
      tabItem(tabName = "intro",
              fluidRow(HTML('<h1 style="text-align:center; color:purple;"><b><u>Teor&iacutea de Detecci&oacuten de Se&ntildeales</u></b></h1>'),
                       HTML('<p style="text-align:center;"><b>por Adriana F. Ch&aacutevez</b></p>')),
              
              fluidRow(column(width=8, offset = 2, background = 'yellow',
                              #fluidRow(box(   
                              HTML('<h2 style="text-align:center; color:purple;"><b>Introducci&oacuten</b></h2>'),
                              HTML('<hr style="border: 0; height: 1px; background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);"'),
                              HTML('<h4 style="text-align:justify;"></h4>'),
                              HTML('<h4 style="text-align:justify;"> La <b>Teor&iacutea de Detecci&oacuten de Se&ntildeales</b> (<b>TDS</b>), proporciona un modelo estadístico para entender el problema al que se enfrentan los organismos cuando tienen que decidir si <i>algo</i> (una <b>se&ntildeal</b> a detectar) est&aacute o no ocurriendo, para poder as&iacute guiar su comportamiento de manera &oacuteptima, de acuerdo con las relaciones de contingencia aprendidas (es decir, las consecuencias anunciadas por la presencia de la se&ntildeal).</h4>'),
                              HTML('<h4 style="text-align:justify;"> La TDS se desarrolla en torno a dos grandes supuestos:</h4>'),
                              HTML('<h4 style="text-align:justify;"> &nbsp <b>1) En toda tarea de detecci&oacuten hay incertidumbre:</b> Todo est&iacutemulo se presenta y percibe con cierta variabilidad (representada con una distribuci&oacuten Normal) y, adem&aacutes, las se&ntildeales coexisten en el mundo con <b>ruido</b> (est&iacutemulos que pueden llegar a confundirse con la se&ntildeal al presentar evidencia similar). Ya sea porque nuestros sistemas perceptuales no est&aacuten lo suficientemete desarrollados para detectar la se&ntildeal de manera inequ&iacutevoca, o porque las se&ntildeales.</h4>'),
                              HTML('<h4 style="text-align:justify;"> &nbsp <b>2) Las consecuencias importan</b>, acertar en el juicio de detecci&oacuten paga, errar cuesta y ambas cosas ocurren con distinta magnitud.</h4>'),
                              HTML('<h4 style="text-align:justify;"> De acuerdo con la <b>TDS</b>, los organismos compensan la incertidumbre con la informaci&oacuten que poseen sobre la estructura de su entorno, fijando un <b>criterio de elecci&oacuten</b> (<i>la l&iacutenea vertical que corta las distribuciones que describen la variabilidad en la presentaci&oacute en los est&iacute con ruido y se&ntilde) a la altura de un valor (x)</i>) que va a determinar a partir de cu&aacutenta evidencia se juzgar&aacute la presencia de la se&ntildeal.</h4>'),
                              HTML('<h4 style="text-align: justify;">La localizaci&oacuten del criterio determina la probabilidad de que el organismo cometa un acierto (un <b>Hit</b> o un <b>Rechazo Correcto</b>) o un error (una <b>Falsa alarma</b> o una <b>Omisi&oacuten</b>.</h3>'),
                              tags$img(height=400, 
                                       width=550,
                                       align="middle",
                                       src = "http://www.kitchensoap.com/wp-content/uploads/2013/07/Screen-Shot-2013-07-22-at-2.13.38-PM.png")),
                       column(width=8, offset = 2, 
                              HTML('<h2 style="text-align:center; color:purple;"><b>Por Ejemplo:</b></h2>'),
                              HTML('<hr style="border: 0; height: 1px; background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);"'),
                              HTML('<h4 style="text-align:justify;"></h4>'),
                              HTML('<h4 style="text-align:justify;">Imagina el caso de una presa que, tras escuchar un ruido tras la maleza, tiene que decidir si se trata, o no, de una amenaza.</h4>'),
                              HTML('<h4 style="text-align:justify;">Por la experiencia que ha adquirido, esta presa sabe que 1) no siempre que un depredador se acerca, este hace el mismo ruido y 2)los depredadores no son lo ÃÂÃÂºnico que causan ruido en la maleza.</h4>'),
                              HTML('<h4 style="text-align:justify;">Si la presa decide que el ruido podrÃÂÃÂ­a ser una amenaza y sale corriendo, pueden ocurrir dos cosas: si acierta, salva su vida y si se equivoca, habrÃÂÃÂ¡ desperdiciado energÃÂÃÂ­a que pudiese haber utilizado en buscar alimento.</h4>'),
                              HTML('<h4 style="text-align:justify;">Por otro lado, si la presa decide que el ruido no fue una amenaza y se queda en su lugar, puede ser el caso que no gane ni pierda nada, si acierta, o en el peor de los casos, si comete una omisiÃÂÃÂ³n, muera devorado.</h4>'),
                              tags$br(),
                              wellPanel(sliderInput(inputId="crit", 
                                                    label = "Criterio",
                                                    value=0, min=-4, max=5,
                                                    step= 0.05)),
                              plotOutput(outputId="sdt_inicial")))
                    ),
      
      # Second tab content
      tabItem(tabName = "about",
              fluidRow(HTML('<h1 style="text-align:center; color:purple;"><b><u>Teor&iacutea de Detecci&oacuten de Se&ntildeales</u></b></h1>'),
                       HTML('<p style="text-align:center;"><b>por Adriana F. Ch&aacutevez</b></p>'),
                       tags$br(),
                       tags$br()),
              HTML('<h1 style="text-align:center;"><b>Secci&oacuten pendiente</b></h1>')),
      
      tabItem(tabName = "roc",
              fluidRow(HTML('<h1 style="text-align:center; color:purple;"><b><u>Teor&iacutea de Detecci&oacuten de Se&ntildeales</u></b></h1>'),
                       HTML('<p style="text-align:center;"><b>por Adriana F. Ch&aacutevez</b></p>'),
                       tags$br(),
                       tags$br()),
                       HTML('<h1 style="text-align:center;"><b>Secci&oacuten pendiente</b></h1>')),
      
      tabItem(tabName = "nop",
              fluidRow(HTML('<h1 style="text-align:center; color:purple;"><b><u>Teor&iacutea de Detecci&oacuten de Se&ntildeales</u></b></h1>'),
                       HTML('<p style="text-align:center;"><b>por Adriana F. Ch&aacutevez</b></p>'),
                       tags$br(),
                       tags$br()),
              HTML('<h1 style="text-align:center;"><b>Secci&oacuten pendiente</b></h1>')),
      
      tabItem(tabName = "para",
              fluidRow(HTML('<h1 style="text-align:center; color:purple;"><b><u>Teor&iacutea de Detecci&oacuten de Se&ntildeales</u></b></h1>'),
                       HTML('<p style="text-align:center;"><b>por Adriana F. Ch&aacutevez</b></p>'),
                       tags$br(),
                       tags$br()),
              HTML('<h1 style="text-align:center;"><b>Secci&oacuten pendiente</b></h1>')))))

server <- function(input, output) {
  output$sdt_inicial <- renderPlot({plot(10, 20, main="", xlab="", ylab="",type='l',
                                    font.lab=2, axes = "FALSE", xlim= c(-4,5),  ylim= c(0,.5),  col="darkorchid3", lwd=2)
    lines(seq(input$crit,10,.05),dnorm(seq(input$crit,10,.05),2,1),type='l', lwd=4, col='forestgreen') #Hit
    lines(seq(input$crit,10,.05),dnorm(seq(input$crit,10,.05),0,1),type='l', lwd=4, col='firebrick3') #FA
    lines(seq(-10,input$crit,.05),dnorm(seq(-10,input$crit,.05),0,1),type='l', lwd=4, col='dodgerblue3') #Rej
    lines(seq(-10,input$crit,.05),dnorm(seq(-10,input$crit,.05),2,1),type='l', lwd=4, col='darkorchid3') #Miss
    lines(seq(-10,10,.05),dnorm(seq(-10,10,.05),0,1),type='l', lwd=1, lty=3, col='white') #NOISE
    lines(seq(-10,10,.05),dnorm(seq(-10,10,.05),2,1),type='l', lwd=1, lty=3, col='white') #SIGNAL
    axis(1,at=c(-4, -3, -2, -1, 0, 1, 2, 3, 4, 5), labels=c("b", "c", "d", "e", "f", "a", "b", "c", "d", "e"), font=2)
    abline(v=input$crit, lwd=2)
    text(-2.9,.5,"Probabilidad de cometer un(a):",cex=1,col='black',f=2)
    text(-3.1,.46,paste("Hit= ",round(pnorm(input$crit,2,1,lower.tail=FALSE),3)), cex=1, col='forestgreen', f=2) 
    text(-3.1,.34,paste("OmisiÃÂÃÂ³n= ",round(pnorm(input$crit,2,1,lower.tail=TRUE),3)), cex=1, col='darkorchid3', f=2) 
    text(-3.1,.42,paste("Falsa Alarma= ",round(pnorm(input$crit,0,1,lower.tail=FALSE),3)), cex=1, col='firebrick3', f=2) 
    text(-3.1,.38,paste("Rechazo Correcto= ",round(pnorm(input$crit,0,1,lower.tail=TRUE),3)), cex=1, col='dodgerblue3', f=2) 
    text(0,.43,"Ruido",cex=1.5,col='black',f=2)
    text(2,.43,"SeÃÂÃÂ±al",cex=1.5,col='black',f=2)
    mtext("Estatura de las mujeres en mi familia",1,cex=1.3, line=3, f=2)})
  
  valores <- reactive({c(input$val_1,input$val_2,input$val_3,input$val_4,input$val_5)})
  output$media <- renderPlot({plot(c(1:5),valores(), main="", xlab="", ylab="", pch=16,
                                   font.lab=2, axes = "FALSE", xlim= c(1,5), ylim= c(0,10), col="purple")
    axis(1,at=c(5, 4, 3, 2, 1),labels=c("Dato 5", "Dato 4", "Dato 3", "Dato 2", "Dato 1"), font=2)
    axis(2,at=c(5, 4, 3, 2, 1, 6, 7, 8, 9, 10),labels=c("5", "4", "3", "2", "1", "6", "7", "8", "9", "10"), font=2)
    lines(c(1,5),c(mean(valores()),mean(valores())), lwd=2, lty=1, col="deepskyblue3")    
    text(1,mean(valores())+1,expression(paste(mu)),cex=2.5,col='black',f=2)
    mtext("Valores'",1,cex=1.3, line=3, f=2)})
  
  output$props <- renderPlot({plot(seq(-6,6,.05), dnorm(seq(-6,6,.05),0,1), main="", xlab="", ylab="",type='l',
                                   font.lab=2, axes = "FALSE", xlim= c(-4,4), col="black", lwd=2)
    axis(1,at=c(4, 3, 2, 1, 0, -4, -3, -2, -1),labels=c("4", "3", "2", "1", "0", "-4", "-3", "-2", "-1"), font=2)
    abline(v=0, lwd=2)       
    abline(v=input$mean, lwd=2)
    abline(v=input$mean, lwd=2)
    text(0.3,.05,expression(paste(mu)),cex=2.5,col='black',f=2)
    text(1.9,(.2),"Hola",cex=1.2,col='white',f=2)
    mtext("Valores'",1,cex=1.3, line=3, f=2)})
  
  output$desviacion <- renderPlot({plot(c(1:5),valores(), main="", xlab="", ylab="", pch=16,
                                        font.lab=2, axes = "FALSE", xlim= c(1,5), ylim= c(0,10), col="purple")
    axis(1,at=c(5, 4, 3, 2, 1),labels=c("Dato 5", "Dato 4", "Dato 3", "Dato 2", "Dato 1"), font=2)
    axis(2,at=c(5, 4, 3, 2, 1, 6, 7, 8, 9, 10),labels=c("5", "4", "3", "2", "1", "6", "7", "8", "9", "10"), font=2)
    lines(c(1,5),c(mean(valores()),mean(valores())), lwd=2, lty=1, col="deepskyblue3")    
    text(1,mean(valores())+1,expression(paste(mu)),cex=2.5,col='black',f=2)
    mtext("Valores'",1,cex=1.3, line=3, f=2)})
}

shinyApp(ui, server)