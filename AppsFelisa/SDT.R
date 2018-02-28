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
                              HTML('<h2 style="text-align:center; color:purple;"><b>Introducci&oacuten</b></h2>'),
                              HTML('<hr style="border: 0; height: 1px; background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);"'),
                              HTML('<h4 style="text-align:justify;"></h4>'),
                              HTML('<h4 style="text-align:justify;"> La <b>Teor&iacutea de Detecci&oacuten de Se&ntildeales</b> (<b>TDS</b>), proporciona un modelo estad&iacutestico para entender el problema al que se enfrentan los organismos cuando tienen que decidir si <i>algo</i> (una <b>se&ntildeal</b> a detectar) est&aacute o no presente en su entorno, para poder guiar su comportamiento de manera &oacuteptima, de acuerdo con las consecuencias anunciadas por la presencia de dicha se&ntildeal.</h4>'),
                              HTML('<h4 style="text-align:justify;"> La TDS describe la <b>detecc&oacuten de se&ntildeales</b> como un problema adaptativo de decisi&oacuten, a partir de dos grandes supuestos:</h4>'),
                              HTML('<h4 style="text-align:justify;"> &nbsp <b>1) En toda tarea de detecci&oacuten hay incertidumbre:</b> Hay variabilidad en la forma en que los est&iacutemulos se perciben y presentan en cada ocasi&oacuten (representada con una distribuci&oacuten Normal), por lo que las se&ntildeales a detectar no siempre se asocian con la misma evidencia. Por otro lado, las se&ntildeales coexisten en el mundo con <b>ruido</b>, est&iacutemulos que pueden llegar a confundirse con la se&ntildeal al asociarse con la misma evidencia. Y ya sea porque los sistemas perceptuales del agente detector son imprecisos en su lectura del mundo, o porque el ruido y la se&ntildeal comparten una gran similitud en la evidencia que producen, la <b>discriminabilidad</b> de estos variar&aacute entre individuos y tareas de detecci&oacuten.</h4>'),
                              HTML('<h4 style="text-align:justify;"> &nbsp <b>2) Las consecuencias importan</b>, acertar en el juicio de detecci&oacuten paga, errar cuesta y ambas cosas ocurren con distinta magnitud.</h4>'),
                              HTML('<h4 style="text-align:justify;"> De acuerdo con la <b>TDS</b>, los organismos compensan la incertidumbre con la informaci&oacuten que poseen sobre la estructura de su entorno, fijando un <b>criterio de elecci&oacuten</b> (<i>la l&iacutenea vertical que corta las distribuciones que describen la variabilidad en la presentaci&oacute en los est&iacute con ruido y se&ntilde) a la altura de un valor (x)</i>) que va a determinar a partir de cu&aacutenta evidencia se juzgar&aacute la presencia de la se&ntildeal.</h4>'),
                              HTML('<center>'),
                              tags$img(height=230, 
                                       width=350,
                                       align="middle",
                                       src = "http://www.kitchensoap.com/wp-content/uploads/2013/07/Screen-Shot-2013-07-22-at-2.13.38-PM.png"),
                              HTML('</center>'),
                              HTML('<h4 style="text-align: justify;">La localizaci&oacuten del criterio determina la probabilidad de que el organismo cometa un acierto (un <b>Hit</b> o un <b>Rechazo Correcto</b>) o un error (una <b>Falsa alarma</b> o una <b>Omisi&oacuten</b>.</h3>'),
                              wellPanel(sliderInput(inputId="crit", 
                                                    label = "Criterio",
                                                    value=0, min=-4, max=5,
                                                    step= 0.05)),
                              plotOutput(outputId="sdt_inicial"),
                              tags$br(),
                              tags$br(),
                              tags$br()),
                       column(width=8, offset = 2, 
                              HTML('<h2 style="text-align:center; color:purple;"><b>Por Ejemplo:</b></h2>'),
                              HTML('<hr style="border: 0; height: 1px; background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);"'),
                              HTML('<h4 style="text-align:justify;"></h4>'),
                              HTML('<h4 style="text-align:justify;">Imagina el caso de una zarig&uumleya que tiene que decidir si el ruido que acaba de escuchar en la maleza, es un depredador (<i>se&ntildeal</i>) u otra cosa (<i>ruido</i>).</h4>'),
                              HTML('<h4 style="text-align:justify;">Sabemos que 1) los depredadores no siempre causan el mismo ruido (hay variabilidad) y 2)existen muchas otras cosas que podr&iacutean generar un ruido similar.</h4>'),
                              HTML('<h4 style="text-align:justify;">Si la presa decide que "s&iacute hay un depredador" y sale corriendo, pueden ocurrir dos cosas: acierta (salva su vida) o se equivoca (habr&aacute desperdiciado energ&iacutea que pudiese haber utilizado en buscar alimento. Por otro lado, si la presa decide "no, no es un depredador" y se queda donde est&aacute, </h4>'),
                              tags$br()))
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
    axis(1,at=c(-4, -3, -2, -1, 0, 1, 2, 3, 4, 5), labels=c("", "", "", "", "", "", "", "", "", ""), font=2)
    abline(v=input$crit, lwd=2)
    text(-2.9,.5,"Probabilidad de cometer un(a):",cex=1,col='black',f=2)
    text(-3.1,.46,paste("Hit= ",round(pnorm(input$crit,2,1,lower.tail=FALSE),3)), cex=1, col='forestgreen', f=2) 
    text(-3.1,.34,paste("Omisi\u{00F3}n= ",round(pnorm(input$crit,2,1,lower.tail=TRUE),3)), cex=1, col='darkorchid3', f=2) 
    text(-3.1,.42,paste("Falsa Alarma= ",round(pnorm(input$crit,0,1,lower.tail=FALSE),3)), cex=1, col='firebrick3', f=2) 
    text(-3.1,.38,paste("Rechazo Correcto= ",round(pnorm(input$crit,0,1,lower.tail=TRUE),3)), cex=1, col='dodgerblue3', f=2) 
    text(0,.43,"Ruido",cex=1.5,col='black',f=2)
    text(2,.43,"Se\u{00F1}al",cex=1.5,col='black',f=2)
    mtext("Evidencia evaluada",1,cex=3, line=3, f=2)})
  
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