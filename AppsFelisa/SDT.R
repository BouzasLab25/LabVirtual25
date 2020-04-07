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
                              #HTML('<br>'),
                              HTML('<h4 style="text-align:justify;"> La TDS describe la <b>detecc&oacuten de se&ntildeales</b> como un problema de decisi&oacuten fundamental para la adaptaci&oacuten de los organismos, a partir de dos grandes supuestos:</h4>'),
                              HTML('<h4 style="text-align:justify;"> &nbsp <b>1) En toda tarea de detecci&oacuten hay incertidumbre:</b> Hay variabilidad en la forma en que los est&iacutemulos se perciben y/o presentan cada vez que se interact&uacutea con ellos: Las se&ntildeales que interesa detectar no se asocian siempre con la misma evidencia y pueden llegar a confundirse con el resto de la estimulaci&oacuten que obtenemos del mundo (el <b>ruido</b>).</h4>'),
                              HTML('<h4 style="text-align:justify;"> &nbsp <b>2) Las consecuencias importan:</b> Acertar en el juicio de detecci&oacuten paga y cometer un error cuesta. Hay una consecuencia espec&iacuteficamente asociada a cada posible resultado a obtener.</h4>'),
                              HTML('<br>'),
                              HTML('<h4 style="text-align:justify;"> De acuerdo con la <b>TDS</b>, los organismos compensan la incertidumbre contenida en la tarea de detecci&oacuten con la informaci&oacuten que poseen sobre la estructura de su entorno para emitir su juicio de detecci&oacuten.</h4>'),
                              HTML('<br>'),
                              HTML('<center>')))
                    ),
      
      # Second tab content
      tabItem(tabName = "about",
              fluidRow(HTML('<h1 style="text-align:center; color:purple;"><b><u>Teor&iacutea de Detecci&oacuten de Se&ntildeales</u></b></h1>'),
                       HTML('<p style="text-align:center;"><b>por Adriana F. Ch&aacutevez</b></p>')),
              
              fluidRow(column(width=8, offset = 2, background = 'yellow',
                              HTML('<h2 style="text-align:center; color:purple;"><b>Detalles sobre el Modelo</b></h2>'),
                              HTML('<hr style="border: 0; height: 1px; background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);"'),
                              HTML('<h4 style="text-align:justify;"></h4>'),
                              HTML('<h4 style="text-align:justify;"> La Teor&iacutea de Detecci&oacuten de Se&ntildeales aparece por primera vez en 1954 en el contexto del estudio y desarrollo de radares para detectar se&ntildeales el&eacutectricas espec&iacuteficas (Peterson, Birdsall y Fox, 1954). Pocos meses despu&eacutes, los psic&oacutelogos John A. Swets y Wilson P. Tanner (1954) trasladaron la teor&iacutea a un contexto psicol&oacutegico, en el estudio de la percepci&ocauten de los organismos. Desde entonces, la SDT constituye uno de los modelos m&aacutes estudiados, desarrollados y ampliamente aplicados en Psicolog&iacutea (Stainslaw y Todorov, 1999), extendi&eacutendose desde su foco inicial en el estudio de la percepci&oacuten hacia el estudio de cualquier escenario donde los organismos se enfrenten al problema de emitir -y guiar su comportamiento en funci&oacuten a- juicios de detecci&oacuten.</h4>'),
                              HTML('<h4 style="text-align:justify;"> La TDS funciona como una herramienta para traducir el desempe&ntildeo observado en tareas de detecci&oacuten en inferencias sobre la precisi&oacuten con que la se&ntildeal se distingue del ruido (la <b>discriminabilidad</b>) y la posible preferencia -o tendencia- del sistema detector a responder en favor o en contra de su detecci&oacuten, de acuerdo a la estructura de la tarea y las consecuencias comprometidas (el <b>sesgo</b>). Esta distinci&oacuten entre la discriminabilidad de los est&iacutemulos comprometidos y el sesgo del sistema, es una de las principales propiedades de la SDT cuya importancia e implicaciones se discuten a continuaci&oacuten.</h4>'),
                              tags$br(),
                              tags$br(),
                              HTML('<h2 style="text-align:center; color:purple;"><b>I. Incertidumbre y Discriminabilidad</b></h2>'),
                              tags$br(),
                              #HTML('<hr style="border: 0; height: 1px; background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);"'),
                              HTML('<h4 style="text-align:justify;"></h4>'),
                              HTML('<h4 style="text-align:justify;"> La TDS define la <b>detecci&oacuten de se&ntildeales</b> como una tarea cargada de incertidumbre. La  variabilidad se considera una propiedad intr&iacutenseca de las se&ntildeales a detectar bajo el supuesto de que ning&uacuten est&iacutemulo se percibe o se presenta de manera id&eacutentica en cada exposici&oacuten. Para ello, <b>el modelo suele representar con una distribuci&oacuten normal la variabilidad impl&iacutecita en la evidencia con la que puede asociarse la se&ntildeal.</b></h4>'),
                              HTML('<h4 style="text-align:justify;"> Tambi&eacuten es necesario tomar en cuenta que las se&ntildeales coexisten en el mundo con otros est&iacutemulos o estados que -dada su propia variabilidad- pueden llegar a producir evidencia similar y ser confundidos por una se&ntildeal. Para capturar esta idea, el modelo suele presentar <b>una segunda distribuci&oacuten normal para representar la variabilidad asociada con el ruido inmerso en el ambiente</b>.</h4>'),
                              HTML('<h4 style="text-align:justify;"> En el marco de la TDS, se entiende por <b>discriminabilidad</b> el grado en que la se&ntildeal puede distinguirse del ruido. Gr&aacuteficamente, la discriminabilidad de los est&iacutemulos se define a partir de <b>la distancia entre las medias de ambas distribuciones</b>, misma que determina el &aacuterea de sobrelape que existe entre estas. <b>A mayor discriminabilidad, menor area de sobrelape.</b></h4>'),
                              column(width=4, offset = 4,
                                     wellPanel(sliderInput(inputId="disc", 
                                                           label = "Discriminabilidad",
                                                           value=2, min=0, max=4,
                                                           step= 0.2))),
                              column(width=6, offset = 3,
                                     plotOutput(outputId="sdt_inicial_d"),
                                     tags$br(),
                                     tags$br(),
                                     tags$br()),
                       column(width=8, offset = 2, background = 'yellow',
                              HTML('<h2 style="text-align:center; color:purple;"><b>II. Elecci&oacuten y sesgos</b></h2>'),
                              tags$br(),
                              #HTML('<hr style="border: 0; height: 1px; background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);"'),
                              #HTML('<h4 style="text-align:justify;"></h4>'),
                              HTML('<h4 style="text-align:justify;"></h4>')),
                              HTML('<center>'),
                              tags$img(height=230, 
                                       width=350,
                                       align="middle",
                                       src = "http://www.kitchensoap.com/wp-content/uploads/2013/07/Screen-Shot-2013-07-22-at-2.13.38-PM.png"),
                              HTML('</center>'),
                              #HTML('<hr style="border: 0; height: 1px; background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);"'),
                              HTML('<h4 style="text-align:justify;"></h4>'),
                              HTML('<h4 style="text-align:justify;"> De acuerdo con la correspondencia entre el estado real del mundo -la presencia o ausencia de la se&ntildeal- y el juicio emitido por el sistema detector, la SDT distingue entre dos tipos de aciertos y errores, ilustrados en la matriz de contingencia anterior.</h4>'),
                              HTML('<h4 style="text-align:justify;">Cuando la <b>se&ntildeal est&aacute presente</b> el organismo puede detectarla adecuadamente (<b>Hit</b>) o dejarla pasar (<b>Omisi&oacuten</b>). Si por el contrario, <b>la se&ntildeal no est&aacute presente</b>, el organismo puede acertar al diagnosticar su ausencia (<b>Rechazo Correcto</b>) o confundir el ruido con la se&ntildeal, (<b>Falsa Alarma</b>). M&aacutes a&uacuten, dependiendo la estructura de la tarea, alguno de estos aciertos representar&aacute una ganancia m&aacutes atractiva, o bien, alguno de los errores un riesgo m&aacutes significativo.</h4>'),
                              HTML('<h4 style="text-align:justify;">La SDT asume que el organismo fija un criterio de elecci&oacuten para determinar a partir de cu&aacutenta evidencia juzgar&aacute la presencia de la se&ntildeal, con base en la informaci&oacuten que posee sobre la probabilidad de que &eacutesta ocurra y las consecuencias comprometidas en su detecci&oacuten.</h4>'),
                              HTML('<h4 style="text-align:justify;">En t&eacuterminos de la representaci&oacuten gr&aacutefica del modelo, el criterio se concibe como una l&iacutenea vertical que atraviesa las distribuciones de ruido y se&ntildeal. De esta forma, el &aacuterea de las distribuciones de ruido y se&nal que caen por encima del criterio, reflejan la probabilidad de cometer una Falsa alarma o un Hit, respectivamente. As&iacute mismo, el complemento de estas probabilidades, o bien, el &aacuterea de las distribuciones que queda debajo del criterio, representan la probabilidad de cometer un Rechazo correcto o una Omisi&oacuten.</h4>')),
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
                              HTML('<h4 style="text-align:justify;"></h4>'),
                              HTML('<h4 style="text-align:justify;">De acuerdo con la informaci&oacuten que posean sobre su entorno, los organismos pueden estar sesgados hacia la procuraci&oacuten o la evitaci&oacuten de alg&uacuten tipo de resultado en particular. <b>La localizaci&oacuten del criterio sobre el eje de evidencia evaluada representa un indicador del sesgo del sistema.</b></h4>'),
                              HTML('<h4 style="text-align:justify;">Un sistema libre de sesgo, que no presentara ninguna preferencia o aversi&oacuten particular hacia ning&uacuten tipo de respuesta deber&iacutea colocar su criterio justo en el punto donde se cruzan las distribuciones, puesto que el &aacuterea de las curvas a cada lado del criterio es la misma, haciendo ambos tipos de acierto y ambos tipos de errores equiprobables. <i>Pru&eacutebalo tu mismo con el graficador de arriba</i></h4>'),
                              HTML('<h4 style="text-align:justify;">Se habla de un sistema sesgado cuando la localizaci&oacuten del criterio incrementa o reduce la probabilidad de cometer un tipo de resultado en espec&iacutefico. La TDS distingue entre dos tipos de sesgos: cuando el criterio se coloca a la izquierda del punto neutral donde se cruzan las distribuciones, hablamos de un <b>sesgo liberal que lleva al organismo a reportar la presencia de la se&ntildeal</b> a&uacuten con niveles bajos de evidencia; por otro lado, cuando el criterio se localiza a la derecha del punto de sesgo-neutro, se habla de un <b>sesgo conservador</b>, pues el organismo se muestra <b>renuente a reportar la presencia de la se&ntildeal</b> a&uacuten con altos niveles de evidencia.</h4>'),
                              tags$br()))),
      
      tabItem(tabName = "roc",
              fluidRow(HTML('<h1 style="text-align:center; color:purple;"><b><u>Teor&iacutea de Detecci&oacuten de Se&ntildeales</u></b></h1>'),
                       HTML('<p style="text-align:center;"><b>por Adriana F. Ch&aacutevez</b></p>')),

              
              fluidRow(column(width=8, offset = 2, background = 'yellow',
                              HTML('<h2 style="text-align:center; color:purple;"><b>Curvas ROC</b></h2>'),
                              HTML('<hr style="border: 0; height: 1px; background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);"'),
                              HTML('<h4 style="text-align:justify;"></h4>'),
                              HTML('<h4 style="text-align:justify;"> Las <b>Curvas ROC</b>   proporciona un modelo estad&iacutestico para entender el problema al que se enfrentan los organismos cuando tienen que decidir si <i>algo</i> (una <b>se&ntildeal</b>) est&aacute o no presente en su entorno, para guiar su comportamiento de manera &oacuteptima, en funci&oacuten de las consecuencias anunciadas por su presencia (o ausencia).</h4>'),
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
                              HTML('<h4 style="text-align: justify;">De acuerdo con la representaci&oacuten gr&aacutefica del modelo de la TDS, la localizaci&oacuten del criterio sobre el eje de Evidencia determina la probabilidad de que el organismo cometa un acierto (un <b>Hit</b> o un <b>Rechazo Correcto</b>) o un error (una <b>Falsa alarma</b> o una <b>Omisi&oacuten</b>. Esta noci&oacuten, elemental en la concepci&oacuten de la detecci&oacuten de se&ntildeales como un problema de decisi&oacuten fundamental para la adaptabilidad de los organismos, puede explorarse a partir del siguiente graficador:</h3>'))),              
              
              fluidRow(column(width=5, offset = 1, 
                              wellPanel(sliderInput(inputId="d_roc", 
                                                    label = "Discriminabilidad (d')",
                                                    value=2, min=-0, max=4,
                                                    step= 0.05))),
                       column(width=5, offset = 0,        
                              wellPanel(sliderInput(inputId="k_roc", 
                                                    label = "Criterio (k)",
                                                    value=0, min=-4, max=4,
                                                    step= 0.05))),
                       column(width=5, offset = 1,
                              plotOutput(outputId="roc_sdt"),
                              tags$br(),
                             tags$br(),
                             tags$br()),
                       column(width=5, offset = 0,
                              plotOutput(outputId="roc_sdt2"),
                              tags$br(),
                              tags$br(),
                              tags$br()))),
      
      tabItem(tabName = "nop",
              fluidRow(HTML('<h1 style="text-align:center; color:purple;"><b><u>Teor&iacutea de Detecci&oacuten de Se&ntildeales</u></b></h1>'),
                       HTML('<p style="text-align:center;"><b>por Adriana F. Ch&aacutevez</b></p>'),
                       tags$br(),
                       tags$br()),
              HTML('<h1 style="text-align:center;"><b>Secci&oacuten pendiente</b></h1>')),
      
      tabItem(tabName = "para",
              fluidRow(HTML('<h1 style="text-align:center; color:purple;"><b><u>Teor&iacutea de Detecci&oacuten de Se&ntildeales</u></b></h1>'),
                       HTML('<p style="text-align:center;"><b>por Adriana F. Ch&aacutevez</b></p>')),
              fluidRow(column(width=8, offset = 2, background = 'yellow',
                              HTML('<h2 style="text-align:center; color:purple;"><b>Estimaci&oacuten param&eacutetrica</b></h2>'),
                              HTML('<hr style="border: 0; height: 1px; background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);"'),
                              HTML('<h4 style="text-align:justify;"></h4>'),
                              HTML('<h4 style="text-align:justify;"> La Teor&iacutea de Detecci&oacuten de Se&ntildeales aparece por primera vez en 1954 en el contexto del estudio y desarrollo de radares para detectar se&ntildeales el&eacutectricas espec&iacuteficas (Peterson, Birdsall y Fox, 1954). Pocos meses despu&eacutes, los psic&oacutelogos John A. Swets y Wilson P. Tanner (1954) trasladaron la teor&iacutea a un contexto psicol&oacutegico, en el estudio de la percepci&ocauten de los organismos. Desde entonces, la SDT constituye uno de los modelos m&aacutes estudiados, desarrollados y ampliamente aplicados en Psicolog&iacutea (Stainslaw y Todorov, 1999), extendi&eacutendose desde su foco inicial en el estudio de la percepci&oacuten hacia el estudio de cualquier escenario donde los organismos se enfrenten al problema de emitir -y guiar su comportamiento en funci&oacuten a- juicios de detecci&oacuten.</h4>'),
                              HTML('<h4 style="text-align:justify;"> La TDS funciona como una herramienta para traducir el desempe&ntildeo observado en tareas de detecci&oacuten en inferencias sobre la precisi&oacuten con que la se&ntildeal se distingue del ruido (la <b>discriminabilidad</b>) y la posible preferencia -o tendencia- del sistema detector a responder en favor o en contra de su detecci&oacuten, de acuerdo a la estructura de la tarea y las consecuencias comprometidas (el <b>sesgo</b>). Esta distinci&oacuten entre la discriminabilidad de los est&iacutemulos comprometidos y el sesgo del sistema, es una de las principales propiedades de la SDT cuya importancia e implicaciones se discuten a continuaci&oacuten.</h4>'),
                              tags$br(),
                              HTML('<h2 style="text-align:center; color:purple;"><b>1. Criterio (k)</b></h2>'),
                              #HTML('<hr style="border: 0; height: 1px; background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);"'),
                              HTML('<h4 style="text-align:justify;"></h4>'),
                              HTML('<h4 style="text-align:justify;"> La TDS define la <b>detecci&oacuten de se&ntildeales</b> como una tarea cargada de incertidumbre. La  variabilidad se considera una propiedad intr&iacutenseca de las se&ntildeales a detectar bajo el supuesto de que ning&uacuten est&iacutemulo se percibe o se presenta de manera id&eacutentica en cada exposici&oacuten. Para ello, <b>el modelo suele representar con una distribuci&oacuten normal la variabilidad impl&iacutecita en la evidencia con la que puede asociarse la se&ntildeal.</b></h4>'),
                              HTML('<h4 style="text-align:justify;"> Tambi&eacuten es necesario tomar en cuenta que las se&ntildeales coexisten en el mundo con otros est&iacutemulos o estados que -dada su propia variabilidad- pueden llegar a producir evidencia similar y ser confundidos por una se&ntildeal. Para capturar esta idea, el modelo suele presentar <b>una segunda distribuci&oacuten normal para representar la variabilidad asociada con el ruido inmerso en el ambiente</b>.</h4>'),
                              HTML('<h4 style="text-align:justify;"> En el marco de la TDS, se entiende por <b>discriminabilidad</b> el grado en que la se&ntildeal puede distinguirse del ruido. Gr&aacuteficamente, la discriminabilidad de los est&iacutemulos se define a partir de <b>la distancia entre las medias de ambas distribuciones</b>, misma que determina el &aacuterea de sobrelape que existe entre estas. <b>A mayor discriminabilidad, menor area de sobrelape.</b></h4>'),
                              column(width=4, offset = 4,
                                     wellPanel(sliderInput(inputId="disc", 
                                                           label = "Discriminabilidad",
                                                           value=2, min=0, max=4,
                                                           step= 0.2))),
                              column(width=6, offset = 3,
                                     plotOutput(outputId="sdt_inicial_d"),
                                     tags$br(),
                                     tags$br(),
                                     tags$br())))))))


server <- function(input, output) {
  
  
  output$sdt_inicial_d <- renderPlot({plot(10, 20, main="", xlab="", ylab="",type='l',
                                         font.lab=2, axes = "FALSE", xlim= c(-2,7),  ylim= c(0,.45),  col="darkorchid3", lwd=2)
    lines(seq(-10,10,.05),dnorm(seq(-10,10,.05),0,1),type='l', lwd=2, lty=1, col='black') #NOISE
    lines(seq(-10,10,.05),dnorm(seq(-10,10,.05),input$disc,1),type='l', lwd=2, lty=1, col='black') #SIGNAL
    axis(1,at=c(-4, -3, -2, -1, 0, 1, 2, 3, 4, 5), labels=c("", "", "", "", "", "", "", "", "", ""), font=2)
    abline(v=input$crit, lwd=2)
    text(0,.43,"Ruido",cex=1.2,col='black',f=2)
    text(2,.43,"Se\u{00F1}al",cex=1.2,col='black',f=2)
    mtext("Evidencia evaluada",1,cex=2, line=3, f=2)})
  
  
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
  
  output$roc_sdt <- renderPlot({plot(10, 20, main="", xlab="", ylab="",type='l',
                                         font.lab=2, axes = "FALSE", xlim= c(-4,5),  ylim= c(0,.5),  col="darkorchid3", lwd=2)
    lines(seq(input$k_roc,10,.05),dnorm(seq(input$k_roc,10,.05),input$d_roc,1),type='l', lwd=4, col='forestgreen') #Hit
    lines(seq(input$k_roc,10,.05),dnorm(seq(input$k_roc,10,.05),0,1),type='l', lwd=4, col='firebrick3') #FA
    lines(seq(-10,input$k_roc,.05),dnorm(seq(-10,input$k_roc,.05),0,1),type='l', lwd=4, col='dodgerblue3') #Rej
    lines(seq(-10,input$k_roc,.05),dnorm(seq(-10,input$k_roc,.05),input$d_roc,1),type='l', lwd=4, col='darkorchid3') #Miss
    lines(seq(-10,10,.05),dnorm(seq(-10,10,.05),0,1),type='l', lwd=1, lty=3, col='white') #NOISE
    lines(seq(-10,10,.05),dnorm(seq(-10,10,.05),2,1),type='l', lwd=1, lty=3, col='white') #SIGNAL
    axis(1,at=c(-4, -3, -2, -1, 0, 1, 2, 3, 4, 5), labels=c("", "", "", "", "", "", "", "", "", ""), font=2)
    abline(v=input$k_roc, lwd=2)
    text(-2.9,.5,"Probabilidad de cometer un(a):",cex=1,col='black',f=2)
    text(-3.1,.46,paste("Hit= ",round(pnorm(input$k_roc,2,1,lower.tail=FALSE),3)), cex=1, col='forestgreen', f=2) 
    text(-3.1,.34,paste("Omisi\u{00F3}n= ",round(pnorm(input$k_roc,2,1,lower.tail=TRUE),3)), cex=1, col='darkorchid3', f=2) 
    text(-3.1,.42,paste("Falsa Alarma= ",round(pnorm(input$k_roc,0,1,lower.tail=FALSE),3)), cex=1, col='firebrick3', f=2) 
    text(-3.1,.38,paste("Rechazo Correcto= ",round(pnorm(input$k_roc,0,1,lower.tail=TRUE),3)), cex=1, col='dodgerblue3', f=2) 
    text(0,.43,"Ruido",cex=1.5,col='black',f=2)
    text(2,.43,"Se\u{00F1}al",cex=1.5,col='black',f=2)
    mtext("Evidencia evaluada",1,cex=3, line=3, f=2)})
  
  
  
  bias_c <- seq(-10,10,0.05) 
  d_null <- 0  
  hits_na <- c()     
  falarms_na <- c()  
  #fAlarms <- c()
  #hits <- c()
  
  for (i in 1:length(bias_c)){
  hits_na[i] <- pnorm((d_null/2)-bias_c[i])      
  falarms_na[i] <- pnorm((-d_null/2)-bias_c[i])
  }
  
  #Hits <- eventReactive(input$d_roc, {
    #for (i in 1:length(bias_c)){
    #  hits[i] <- pnorm((-(input$d_roc)/2)-bias_c[i])
    #}
  #})
  
#  FAlarms <- eventReactive(input$d_roc, {
#    for (i in 1:length(bias_c)){
 #     fAlarms[i] <- pnorm((input$d_roc/2)-bias_c[i])
    #}
 # })
  
  output$roc_sdt2 <- renderPlot({
    plot(.5,.5, pch=16, col='white', xlim=c(0,1), ylim=c(0,1), xlab='F.A. Rate', ylab='Hit Rate')    
    lines(pnorm((-(input$d_roc)/2)-bias_c), pnorm((input$d_roc/2)-bias_c), lwd=2, col='deepskyblue2')   
    lines(hits_na,falarms_na,lwd=1,col='black', lty=2) 
    lines(c(0.38, 0.48),c(0.2,0.2), lwd=2, lty=1, col="deepskyblue3")      
    points(0.43,0.1, lty=3, pch=16, col='deepskyblue4')
    points(pnorm(input$k_roc,input$d_roc,1), pnorm(input$k_roc,0,1),  cex=2, lty=3, pch=16, col='deepskyblue4')
    text(0.5, 0.2, labels="Combinaciones posibles Hits-F.A. por d'", offset=0, cex = 0.7, pos=4)
    text(0.5, 0.1, labels="Tasas de Hits y F.A. asociados con k", offset=0, cex = 0.7, pos=4)
    text(0.85, 0.83, labels="d' = 0", offset=0, cex = 0.8, pos=4)
    #text(fa_rate-0.13, h_rate+0.02, paste("d' =", d), offset=0, cex = 0.8, pos=4)
    title('ROC')})
  }

shinyApp(ui, server)