library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(
    disable = TRUE),
  dashboardSidebar(
    width = 190,
    sidebarMenu(
      menuItem("Introducción", tabName = "intro", icon = icon("book")),
      menuItem("Sobre el modelo", tabName = "about", icon = icon("star-o")),
      menuItem("Curvas ROC", tabName="roc", icon = icon("star-o")),
      menuItem("Análisis No Paramétrico", tabName="nop", icon = icon("book")),
      menuItem("Estimación Paramétrica", tabName="para", icon = icon("info")))),
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
              fluidRow(HTML('<h1 style="text-align:center; color:purple;"><b><u>Teoría de Detección de Señales</u></b></h1>'),
                       HTML('<p style="text-align:center;"><b>por Adriana F. Chávez</b></p>')),
              
              fluidRow(column(width=5, offset = 1, background = 'yellow',
                              #fluidRow(box(   
                              HTML('<h2 style="text-align:center; color:purple;"><b>Introducción</b></h2>'),
                              HTML('<hr style="border: 0; height: 1px; background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);"'),
                              HTML('<h4 style="text-align:justify;"></h4>'),
                              HTML('<h4 style="text-align:justify;"> La <b>Teoría de Detección de Señales</b> (<b>SDT</b>, por sus siglas en inglés), describe el problema de decisión al que se enfrentan los organismos cuando, en un entorno con incertidumbre, tienen que decidir si <i>algo</i> (la <b>señal</b>) está o no presente, para poder actuar en consecuencia.</h4>'),
                              HTML('<h4 style="text-align:justify;"> El desarrollo de la SDT gira en torno a dos grandes supuestos: <b>1) Siempre hay algún grado de incertidumbre</b> al detectar algo, por tres grandes razones: 1.- Nuestros sistemas perceptuales son imperfectos, 2.- Toda señal a detectar se presenta en el mundo con cierta variabilidad y 3.- Las señales coexisten en el mundo con <b>ruido</b>: estímulos que sin ser la señal, pueden llegar a confundirse con esta; y  <b>2) Las consecuencias importan</b>, acertar en el juicio de detección paga, errar cuesta y ambas cosas ocurren en distinta magnitud.</h4>'),
                              HTML('<h4 style="text-align:justify;"> De acuerdo con la <b>TDS</b>, los organismos ponderan la información que poseen sobre la estructura de su entorno para compensar la incertidumbre contenida en la tarea (<i>representada gráficamente como el área de sobrelape entre las distribuciones de probabilidad que describen la presentación del Ruido y la Señal</i>), fijando un <b>criterio de elección</b> (<i>la línea vertical que corta ambas distribuciones a la altura de un valor (x)</i>) que va a fungir como punto de corte para determinar a partir de cuánta evidencia se juzgará la presencia de la señal.</h4>'),
                              HTML('<h4 style="text-align: justify;">En función a la correspondencia entre la presencia o asuencia de la señal en el mundo y el juicio de elección emitido por el organismo, podemos identificar dos grandes tipos de aciertos y errores: los <b>Hits</b> ("Sí" cuando sí) y los <b>Rechazos Correctos</b> ("No" cuando no); y las <b>Falsas Alarmas</b> ("Sí" cuando no) y <b>Omisiones</b> ("No" cuando sí). Y de acuerdo con la representación gráfica de la SDT, la probabilidad de cometer cada uno de estos aciertos y errores estará determinada por el área de las distribuciones de Ruido y Señal que caigan a cada lado del criterio de elección, según sea el caso.</h3>'),
                              tags$img(height=100, 
                                       width=100,
                                       src = "https://github.com/BouzasLab25/LabVirtual25/blob/Apps/AppsFelisa/SDT_Outcomes.jpg"),
                              wellPanel(sliderInput(inputId="crit", 
                                                    label = "Criterio",
                                                    value=0, min=-4, max=5,
                                                    step= 0.05))),
                       column(width=5, offset = 0, 
                              HTML('<h2 style="text-align:center; color:purple;"><b>Por Ejemplo:</b></h2>'),
                              HTML('<hr style="border: 0; height: 1px; background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);"'),
                              HTML('<h4 style="text-align:justify;"></h4>'),
                              HTML('<h4 style="text-align:justify;">Imagina el caso de una presa que, tras escuchar un ruido tras la maleza, tiene que decidir si se trata, o no, de una amenaza.</h4>'),
                              HTML('<h4 style="text-align:justify;">Por la experiencia que ha adquirido, esta presa sabe que 1) no siempre que un depredador se acerca, este hace el mismo ruido y 2)los depredadores no son lo único que causan ruido en la maleza.</h4>'),
                              HTML('<h4 style="text-align:justify;">Si la presa decide que el ruido podría ser una amenaza y sale corriendo, pueden ocurrir dos cosas: si acierta, salva su vida y si se equivoca, habrá desperdiciado energía que pudiese haber utilizado en buscar alimento.</h4>'),
                              HTML('<h4 style="text-align:justify;">Por otro lado, si la presa decide que el ruido no fue una amenaza y se queda en su lugar, puede ser el caso que no gane ni pierda nada, si acierta, o en el peor de los casos, si comete una omisión, muera devorado.</h4>'),
                              plotOutput(outputId="sdt_inicial")))
                    ),
      
      # Second tab content
      tabItem(tabName = "about",
              fluidRow(HTML('<h1 style="text-align:center; color:purple;"><b><u>Teoría de Detección de Señales</u></b></h1>'),
                       HTML('<p style="text-align:center;"><b>por Adriana F. Chávez</b></p>')),
              
              fluidRow(column(width=5, offset = 1, background = 'yellow',
                              HTML('<h1 style="text-align:center; color:purple;"><b>Más sobre el modelo</b></h1>'),
                              HTML('<hr style="border: 0; height: 1px; background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);"'),
                              HTML('<h3 style="text-align:justify;"> La media no es otra cosa que el <b>promedio</b> de los valores registrados para cierta variable.</h3>'),
                              tags$br(),
                              tags$br(),
                              fluidRow(column(width=2, offset=1,
                                              wellPanel(numericInput(inputId="val_1", 
                                                                     label = "Dato 1",
                                                                     value=1, min=0, max=10,
                                                                     width='150px'))),
                                       column(width=2, 
                                              wellPanel(numericInput(inputId="val_2", 
                                                                     label = "Dato 2",
                                                                     value=1, min=0, max=10,
                                                                     width='150px'))),
                                       column(width=2,
                                              wellPanel(numericInput(inputId="val_3", 
                                                                     label = "Dato 3",
                                                                     value=1, min=0, max=10,
                                                                     width='150px'))),
                                       column(width=2, 
                                              wellPanel(numericInput(inputId="val_4", 
                                                                     label = "Dato 4",
                                                                     value=1, min=0, max=10,
                                                                     width='150px'))),
                                       column(width=2,
                                              wellPanel(numericInput(inputId="val_5", 
                                                                     label = "Dato 5",
                                                                     value=1, min=0, max=10,
                                                                     width='150px')))),
                              HTML('<h4 style="text-align: justify;">La media funciona como una <b>medida de tendencia central</b> que permite describir en torno a quÃ© valor se distribuyen las observaciones de cierta variable.</h3>')),
                       column(width=5, offset = 0, plotOutput(outputId="media")))
      ),
      
      tabItem(tabName = "roc",
              fluidRow(HTML('<h1 style="text-align:center; color:purple;"><b><u>Teoría de Detección de Señales</u></b></h1>'),
                       HTML('<p style="text-align:center;"><b>por Adriana F. Chávez</b></p>')),
              HTML('<h4>Sección pendiente</h4>')),
      
      tabItem(tabName = "nop",
              fluidRow(HTML('<h1 style="text-align:center; color:purple;"><b><u>Teoría de Detección de Señales</u></b></h1>'),
                       HTML('<p style="text-align:center;"><b>por Adriana F. Chávez</b></p>'))),
      
      tabItem(tabName = "para",
              fluidRow(HTML('<h1 style="text-align:center; color:purple;"><b><u>Teoría de Detección de Señales</u></b></h1>'),
                       HTML('<p style="text-align:center;"><b>por Adriana F. Chávez</b></p>'))
    )
      )
      ))

server <- function(input, output) {
  signal_inicial <- dnorm(seq(-10,10,.05),2,1)
  noise_inicial <-  dnorm(seq(-10,10,.05), 0,1) 
  output$sdt_inicial <- renderPlot({plot(seq(-10,10,.05), signal_inicial, main="", xlab="", ylab="",type='l',
                                    font.lab=2, axes = "FALSE", xlim= c(-4,5), col="purple")
    lines(seq(-10,10,.05),noise_inicial,type='l',col='blue')
    axis(1,at=c(-4, -3, -2, -1, 0, 1, 2, 3, 4, 5), labels=c("b", "c", "d", "e", "f", "a", "b", "c", "d", "e"), font=2)
    abline(v=input$crit, lwd=2)
    text(-3.1,.4,"Probabilidad de cometer un(a):",cex=1,col='black',f=2)
    text(-3.1,.36,paste("Hit= ",input$crit), cex=1, col='green', f=2) 
    text(input$crit+.9,.05,expression(paste(mu)),cex=2.5,col='black',f=2)
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