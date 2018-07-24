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
                              HTML('<h4 style="text-align:justify;"> La <b>Teor&iacutea de Detecci&oacuten de Se&ntildeales</b> (<b>TDS</b>) proporciona un modelo estad&iacutestico para entender el problema al que se enfrentan los organismos cuando tienen que decidir si <i>algo</i> (una <b>se&ntildeal</b>) est&aacute o no presente en su entorno, para guiar su comportamiento de manera &oacuteptima, en funci&oacuten de las consecuencias anunciadas por su presencia (o ausencia).</h4>'),
                              HTML('<h4 style="text-align:justify;"> La TDS describe la <b>detecc&oacuten de se&ntildeales</b> como un problema de decisi&oacuten fundamental para la adaptaci&oacuten de los organismos, a partir de dos grandes supuestos:</h4>'),
                              HTML('<h4 style="text-align:justify;"> &nbsp <b>1) En toda tarea de detecci&oacuten hay incertidumbre:</b> Hay variabilidad en la forma en que los est&iacutemulos se perciben y presentan cada vez que se interact&uacutea con ellos. Esta idea es gr&aacuteficamente representada con una distribuci&oacuten Normal, que describe la probabilidad de que un mismo est&iacutemulo se asocie con distintos grados de evidencia. Adem&aacutes de ello, hay que tomar en cuenta que, las se&ntildeales a detectar coexisten en el mundo con <b>ruido</b>, est&iacutemulos que dada su propia variabilidad, pueden llegar a producir evidencia similar y confundirse con una se&ntildeal.</h4>'),
                              HTML('<h4 style="text-align:justify;"> Dependiendo la agudeza del sistema detector o bien, de la naturaleza propia de los est&iacutemulos ruido y se&ntildeal (qu&eacute tan similares son), la <b>discriminabilidad</b> de estos variar&aacute entre individuos y tareas de detecci&oacuten.</h4>'),
                              HTML('<h4 style="text-align:justify;"> &nbsp <b>2) Las consecuencias importan:</b> Acertar en el juicio de detecci&oacuten paga y cometer un error cuesta. M&aacutes a&uacuten, la magnitud de las consecuencias en juego var&iacute para cada uno de los posibles resultados (aciertos o errores) a obtener:</h4>'),
                              HTML('<br>'),
                              HTML('<center>'),
                              tags$img(height=230, 
                                       width=350,
                                       align="middle",
                                       src = "http://www.kitchensoap.com/wp-content/uploads/2013/07/Screen-Shot-2013-07-22-at-2.13.38-PM.png"),
                              HTML('</center>'),
                              HTML('<br>'),
                              HTML('<br>'),
                              HTML('<h4 style="text-align:justify;"> De acuerdo con la <b>TDS</b>, los organismos compensan la incertidumbre contenida en la tarea de detecci&oacuten con la informaci&oacuten que poseen sobre la estructura de su entorno. En general, dicha informaci&oacuten puede ser de dos tipos: a) <b>informaci&oacuten probabil&iacutestica</b> (i.e. &iquestQu&eacute tan probable es que ocurra una se&ntildeal en este contexto?) y b)<b> informaci&oacuten sobre las consecuencias en juego</b> (i.e. &iquestQu&eacute tipo de error me conviene m&aacutes evitar? o bien, &iquestQu&eacute acierto me convendr&iacutea cometer, a&uacuten por mero azar?). Con base en ello, el sistema detector fija un <b>criterio de elecci&oacuten</b> (gr&aacuteficamente representado con una l&iacutenea vertical que corta las distribuciones trazadas para describir la variabilidad con que se dan los est&iacutemulos con ruido y se&ntildeal), que va a servir como regla de elecci&oacuten para definir a partir de qu&eacute valor (x) en el eje de evidencia se juzgar&aacute la presencia de la se&ntildeal.</h4>'),
                              HTML('<br>'),
                              HTML('<h4 style="text-align: justify;">De acuerdo con la representaci&oacuten gr&aacutefica del modelo de la TDS, la localizaci&oacuten del criterio sobre el eje de Evidencia determina la probabilidad de que el organismo cometa un acierto (un <b>Hit</b> o un <b>Rechazo Correcto</b>) o un error (una <b>Falsa alarma</b> o una <b>Omisi&oacuten</b>. Esta noci&oacuten, elemental en la concepci&oacuten de la detecci&oacuten de se&ntildeales como un problema de decisi&oacuten fundamental para la adaptabilidad de los organismos, puede explorarse a partir del siguiente graficador:</h3>')),
                              column(width=4, offset = 4,
                              wellPanel(sliderInput(inputId="crit", 
                                                    label = "Criterio",
                                                    value=0, min=-4, max=5,
                                                    step= 0.05))),
                              column(width=6, offset = 3,
                              plotOutput(outputId="sdt_inicial"),
                              tags$br(),
                              tags$br(),
                              tags$br()),
                       column(width=8, offset = 2, 
                              HTML('<h2 style="text-align:center; color:purple;"><b>Ejemplo:</b></h2>'),
                              HTML('<hr style="border: 0; height: 1px; background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);"'),
                              HTML('<h4 style="text-align:justify;"></h4>'),
                              HTML('<h4 style="text-align:justify;">Imaginemos el caso de un conejo que repentinamente se encuentra ante la importante tarea de decidir si el ruido que acaba de escuchar en la maleza fue producido por un depredador (<i>la se&ntildeal</i> a detectar) u otra cosa (<i>el ruido</i> en el ambiente).</h4>'),
                              HTML('<h4 style="text-align:justify;">Sabemos que <b>(1)</b> los depredadores no siempre causan el mismo ruido y que existen muchas otras cosas que podr&iacutean generar un ruido similar (<i>hay incertidumbre en la tarea ocasionada por la variabilidad de los est&iacutemulos</i>), y que <b>(2)</b> las consecuencias comprometidas en la tarea son sustancialmente diferentes: Si el conejo echa a correr y resulta que ha cometido un <i>Hit</i>, habr&aacute salvado su vida, y a&uacuten si hubiera resultado en una <i>Falsa Alarma</i>, el conejo simplemente habr&iacutea desperdiciado energ&iacutea; Por otro lado, si el conejo decide quedarse pastando (i.e. decide "no, no ha sido un depredador") y resulta que ha cometido una <i>Omisi&oacuten</i>, muy seguramente terminar&aacute siendo devorado.</h4>'),
                              HTML('<h4 style="text-align:justify;">En este caso, dadas las consecuencias involcuradas en la tarea, esperar&iacutemos que el conejo colocara su criterio de elecci&oacuten muy a la izquierda en el eje de Evidencia, de manera tal que estar&iacutea emitiendo juicios de "S&iacute, se trata de un depredador" a&uacuten con niveles de evidencia muy bajos; todo por maximizar la probabilidad de cometer un <i>Hit</i> y evitar a toda costa las <i>Omisiones</i>.</h4>'),
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
                       tags$br(), 
                       column(width=4, offset = 4,
                              wellPanel(sliderInput(inputId="crit", 
                                                    label = "Criterio",
                                                    value=0, min=-4, max=5,
                                                    step= 0.05))),
                       column(width=6, offset = 3,
                              plotOutput(outputId="sdt_inicial"),
                              tags$br(),
                              tags$br(),
                              tags$br())),
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
  
}

shinyApp(ui, server)