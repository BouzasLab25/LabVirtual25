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
      menuItem("Estimaci\u{00F3}n Param\u{00E9}trica", tabName="para", icon = icon("info"))
      #menuItem("Analisis No Param\u{00E9}trico", tabName="nop", icon = icon("info"))
      )),
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
                      border-color:#000000;}
                      .js-irs-0 .irs-single, .js-irs-0 .irs-bar-edge, .js-irs-0 .irs-bar {
                      background: #AC58FA;}

                      .js-irs-1 .irs-bar {
                      border-top-color: #000000; border-bottom-color: #000000;} 
                      .js-irs-1 .irs-bar-edge {
                      border-color:#000000;}
                      .js-irs-1 .irs-single, .js-irs-1 .irs-bar-edge, .js-irs-1 .irs-bar {
                      background: #000000;}
                      
                      .js-irs-2 .irs-bar {
                      border-top-color: #000000; border-bottom-color: #000000;} 
                      .js-irs-2 .irs-bar-edge {
                      border-color:#000000;}
                      .js-irs-2 .irs-single, .js-irs-2 .irs-bar-edge, .js-irs-2 .irs-bar {
                      background: #AC58FA;}
                      
                      .js-irs-3 .irs-bar {
                      border-top-color: #000000; border-bottom-color: #000000;} 
                      .js-irs-3 .irs-bar-edge {
                      border-color:#000000;}
                      .js-irs-3 .irs-single, .js-irs-3 .irs-bar-edge, .js-irs-3 .irs-bar {
                      background: #D19D12;}'))),
    tabItems(
      
############ INTRODUCCION
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
                              HTML('<center>')))),
      
############ ACERCA DEL MODELO
      tabItem(tabName = "about",
              fluidRow(HTML('<h1 style="text-align:center; color:purple;"><b><u>Teor&iacutea de Detecci&oacuten de Se&ntildeales</u></b></h1>'),
                       HTML('<p style="text-align:center;"><b>por Adriana F. Ch&aacutevez</b></p>')),
              fluidRow(column(width=8, offset = 2, background = 'yellow',
                              HTML('<h2 style="text-align:center; color:purple;"><b>Detalles sobre el Modelo</b></h2>'),
                              HTML('<hr style="border: 0; height: 1px; background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);"'),
                              HTML('<h4 style="text-align:justify;"></h4>'),
                              HTML('<h4 style="text-align:justify;"> La <b>Teor&iacutea de Detecci&oacuten de Se&ntildeales</b> (<b>TDS</b>) aparece por primera vez en 1954 en el contexto del estudio y desarrollo de radares para detectar se&ntildeales el&eacutectricas espec&iacuteficas (Peterson, Birdsall y Fox, 1954). Pocos meses despu&eacutes, los psic&oacutelogos John A. Swets y Wilson P. Tanner (1954) trasladaron la teor&iacutea a un contexto psicol&oacutegico para contribuir al estudio de la percepci&oacuten como proceso cognitivo. Desde entonces, la SDT constituye uno de los modelos m&aacutes estudiados, generalizados y ampliamente aplicados en Psicolog&iacutea (Stainslaw y Todorov, 1999), extendi&eacutendose desde el estudio de sistemas perceptuales hacia el estudio de cualquier fen&oacutemeno o  escenario donde los organismos -como agentes de decisi&oacuten- se enfrenten al problema de emitir juicios de detecci&oacuten en funci&oacuten a los cuales deben guiar su comportamiento.</h4>'),
                              HTML('<h4 style="text-align:justify;"> La TDS funciona como un modelo descriptivo que permite, a partir del desempe&ntildeo observado en tareas de detecci&oacuten, hacer inferencias sobre la precisi&oacuten con que la se&ntildeal se distingue del ruido (<b>discriminabilidad</b>) y la posible preferencia -o tendencia- del sistema detector a responder en favor o en contra de su detecci&oacuten, de acuerdo a la estructura de la tarea (<b>sesgo</b>). Esta distinci&oacuten entre la discriminabilidad de los est&iacutemulos comprometidos y el sesgo del sistema, es una de las principales propiedades de la SDT cuyas implicaciones se discuten a continuaci&oacuten.</h4>'),
                              tags$br(),
                              tags$br(),
                              HTML('<h2 style="text-align:justify; color:purple;"><b>I. Incertidumbre y Discriminabilidad</b></h2>'),
                              #tags$br(),
                              HTML('<h4 style="text-align:justify;"></h4>'),
                              HTML('<h4 style="text-align:justify;"> La TDS define la <b>detecci&oacuten de se&ntildeales como una tarea cargada de incertidumbre</b>. La  variabilidad se considera una propiedad intr&iacutenseca de las se&ntildeales a detectar bajo el supuesto de que ning&uacuten est&iacutemulo se percibe o se presenta de manera id&eacutentica en cada exposici&oacuten. El modelo suele <b>describir la variabilidad impl&iacutecita en la evidencia asociada con la Se&ntildeal con una distribuci&oacuten normal.</b></h4>'),
                              HTML('<h4 style="text-align:justify;"> Tambi&eacuten es necesario tomar en cuenta que las se&ntildeales coexisten en el mundo con otros est&iacutemulos o estados que -dada su propia variabilidad- pueden llegar a producir evidencia similar a la se&ntildeal y ser confundidos con ella. Para capturar esta idea, el modelo suele presentar <b>una segunda distribuci&oacuten normal para representar la variabilidad asociada con el Ruido en el ambiente</b>.</h4>'),
                              HTML('<h4 style="text-align:justify;"> En el marco de la TDS, <b>la discriminabilidad</b> representa el grado en que la se&ntildeal puede distinguirse del ruido. Gr&aacuteficamente, la discriminabilidad se ve reflejada por <b>la distancia entre las medias de las distribuciones de Ruido y Se&ntildeal</b>, que determina el tama&ntildeo total del sobrelape que existe entre estas. <b>A mayor discriminabilidad, menor area de sobrelape.</b></h4>'),
                              column(width=8, offset = 2,
                                     wellPanel(sliderInput(inputId="disc", 
                                                           label = "Discriminabilidad*",
                                                           value=2, min=0, max=4,
                                                           step= 0.2))),
                              column(width=10, offset = 1,
                                     plotOutput(outputId="sdt_inicial_d")))),
              fluidRow(column(width=8, offset = 2, background = 'yellow',
                              HTML('<h4 style="text-align:justify;"><b>*</b> Al ser definida como una distancia, la discriminabilidad s&oacutelo puede ser interpretada en t&eacuterminos de valores positivos.</h4>'),
                              tags$br(),
                              tags$br(),
                              HTML('<h2 style="text-align:justify; color:purple;"><b>II. Elecci&oacuten y sesgos</b></h2>'),
                              HTML('<h4 style="text-align:justify;"> De acuerdo con la <b>correspondencia entre el estado real del mundo</b> (la presencia o ausencia de la se&ntildeal) <b>y el juicio de detecci&oacuten emitido</b> por el sistema detector (-S&iacute, est&aacute la se&ntildeal /No, no est&aacute la se&ntildeal-), la TDS distingue entre dos tipos de aciertos y dos tipos de errores errores, captudados en la siguiente matriz de contingencia:</h4>'),
                              HTML('<center>'),
                              tags$img(height=230, 
                                       width=350,
                                       align="middle",
                                       src = "http://www.kitchensoap.com/wp-content/uploads/2013/07/Screen-Shot-2013-07-22-at-2.13.38-PM.png"),
                              HTML('</center>'),
                              #HTML('<hr style="border: 0; height: 1px; background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);"'),
                              HTML('<h4 style="text-align:justify;"></h4>'),
                              HTML('<h4 style="text-align:justify;">Cuando la <b>se&ntildeal est&aacute presente</b> el organismo puede detectarla adecuadamente (<b>Hit</b>) o dejarla pasar (<b>Omisi&oacuten</b>), y por el contrario, cuando <b>la se&ntildeal no est&aacute presente</b>, el organismo puede reportar acertadamente su ausencia (<b>Rechazo Correcto</b>) o confundir el ruido con la se&ntildeal, (<b>Falsa Alarma</b>).</h4>'),
                              HTML('<h4 style="text-align:justify;">Dependiendo de la <b>estructura de la tarea</b>, alguno de los resultados puede estar asociado con una ganancia o con una p&eacuterdida mayor. Es por ello que la TDS funciona como un <b>modelo de decisi&oacuten</b> donde se asume que el organismo fija <b>un criterio de elecci&oacuten</b> para determinar a partir de cu&aacutenta evidencia juzgar&aacute la presencia de la se&ntildeal, de acuerdo con estructura probabil&iacutestica de su entorno y las consecuencias en juego.</h4>'),
                              HTML('<h4 style="text-align:justify;">El criterio de elecci&oacuten se representa gr&aacuteficamente como una <b>l&iacutenea vertical que atraviesa las distribuciones de ruido y se&ntildeal</b> y se&ntildeala a partir de qu&eacute evidencia el organismo determinar&aacute si <i>S&iacute</i> o <i>No</i> ha detectado la se&ntildeal. De esta forma, <b>el &aacuterea de las distribuciones de Ruido y Se&ntildeal</b> que caen por encima del criterio, <b>refleja la probabilidad</b> de cometer una Falsa alarma o un Hit, respectivamente, y el &aacuterea que cae por debajo del criterio, la probabilidad de cometer un Rechazo correcto o una Omisi&oacuten.</h4>'),
                       column(width=8, offset = 2,
                              wellPanel(sliderInput(inputId="crit", 
                                                    label = "Criterio",
                                                    value=0, min=-4, max=5,
                                                    step= 0.05))),
                       column(width=11, offset = 1,
                              plotOutput(outputId="sdt_inicial_k"),
                              tags$br(),
                              tags$br(),
                              tags$br()))),
              fluidRow(column(width=8, offset = 2, background = 'yellow',
                              HTML('<h4 style="text-align:justify;"></h4>'),
                              HTML('<h4 style="text-align:justify;">De acuerdo con la informaci&oacuten que posean sobre su entorno, los organismos pueden estar sesgados para procurar o evitar alg&uacuten tipo de resultado en particular. <b>La localizaci&oacuten del criterio es un reflejo del sesgo que pudiera presentar el sistema.</b></h4>'),
                              HTML('<h4 style="text-align:justify;">Un sistema libre de sesgo (<b>sesgo neutral</b>), deber&iacutea colocar su criterio de elecci&oacuten justo en el punto donde se intersectan las distribuciones de Ruido y Se&ntidleal, pues de esta forma, el &aacuterea de las distribuciones a cada lado del criterio ser&iacutea la misma, garantizando la equiprobabilidad entre  ambos tipos de aciertos y ambos tipos de errores. <i>Pru&eacutebalo tu mismo con el graficador de arriba</i></h4>'),
                              HTML('<h4 style="text-align:justify;">Se habla de un sesgo en el sistema cuando la localizaci&oacuten del criterio incrementa o reduce la probabilidad de obtener ciertos resultados. La TDS distingue entre dos tipos de sesgos: cuando el criterio se coloca a la izquierda del punto neutral ya descrito, hablamos de un <b>sesgo liberal</b> que lleva al organismo a <b>reportar la presencia de la se&ntildeal</b> a&uacuten con niveles bajos de evidencia; por otro lado, cuando el criterio se localiza a la derecha del punto neutral, se habla de un <b>sesgo conservador</b>, pues el organismo se muestra <b>renuente a reportar la presencia de la se&ntildeal</b> a&uacuten con altos niveles de evidencia.</h4>'),
                              tags$br(),
                              tags$br(),
                              tags$br(),
                              HTML('<hr style="border: 0; height: 1px; background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);"'),
                              HTML('<h4 style="text-align:justify;"></h4>'),
                              HTML('<h2 style="text-align:justify; color:purple;"><b>Referencias</b></h2>'),
                              HTML('<h4 style="text-align:justify;"><b>1.</b> Peterson, W.W., Birdsall, T. G., y Fox, W. C. (1954). The theory of signal detectability. IRE Trans. on Information Theory, 12(4), 171-212.</h4>'),
                              HTML('<h4 style="text-align:justify;"><b>2.</b> Tanner, W. P., y Swets, J. A. (1954). A decision-making theory of visual detection. Psychological Review, 61(6), 401-409.</h4>'),
                              HTML('<h4 style="text-align:justify;"><b>3. </b> Stainslaw, H., y Todorov, N. (1999). Calculation of signal detection theory measures.Behavior ResearchMethods, Instruments and Computers, 31(1), 137-149.</h4>'),
                              HTML('<h4 style="text-align:justify;"> </h4>'),
                              tags$br()))),


############ CURVAS ROC      
      tabItem(tabName = "roc",
              fluidRow(HTML('<h1 style="text-align:center; color:purple;"><b><u>Teor&iacutea de Detecci&oacuten de Se&ntildeales</u></b></h1>'),
                       HTML('<p style="text-align:center;"><b>por Adriana F. Ch&aacutevez</b></p>')),
              fluidRow(column(width=8, offset = 2, background = 'yellow',
                              HTML('<h2 style="text-align:center; color:purple;"><b>Curvas ROC</b></h2>'),
                              HTML('<hr style="border: 0; height: 1px; background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);"'),
                              HTML('<h4 style="text-align:justify;"></h4>'),
                              HTML('<h4 style="text-align:justify;"> Las <b>Curvas ROC</b>  (identificadas as&iacute por su nombre en ingl&eacutes: <i>Receiver-Operating Characteristic Curve</i>) describen la relaci&oacuten entre las tasas de Hits y Falsas Alarmas que se espera observar en una tarea de detecci&oacuten para cada localizaci&oacuten posible del criterio de elecci&oacuten, dada la discriminabilidad de los est&iacutemulos (es decir, la distancia entre las distribuciones de Se&ntildeal y Ruido).</h4>'),
                              HTML('<h4 style="text-align:justify;"> Las curvas ROC representan una herramienta para evaluar la sensibilidad del sistema detector evaluado, bajo el supuesto de que la discriminabilidad -entendida como una cualidad de los est&iacutemulos- es constante y s&oacutelo se tiene control sobre la localizaci&oacuten espec&iacutefica del criterio, que depende de la estructura de la tarea y el sesgo que de ella resulte.</h4>'),
                              HTML('<br>'))),              
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
                              plotOutput(outputId="roc_sdt2"))),
              fluidRow(column(width=8, offset = 2, background = 'yellow',
                              HTML('<h4 style="text-align:justify;"> El &aacuterea bajo la curva ROC (AUC, por sus siglas en ingles: Area Under the Curve) representa una forma precisa y completa de evaluar la sensibilidad del sistema detector ante la tarea estudiada. N&oacutetese que se habla de <b>Sensibilidad</b> y no de <b>Discriminabilidad</b> porque, aunque ambos conceptos refieren a qu&eacute tan f&aacutecil es para el sistema distinguir entre la se&ntildeal y el ruido y se relacionan directamente con la distancia que existe entre sus distribuciones, la primera apela a la precisi&oacuten con que el sistema detector puede responder a la tarea -utilizando distintas estrategias o reglas de elecci&oacuten- y la segunda, a una cualidad inherente a los est&iacutemulos.</h4>'),
                              HTML('<h4 style="text-align:justify;"> En general, a mayor discriminabilidad, menor incertidumbre en la tarea de detecci&oacuten. Cuando la se&ntildeal es indistinguible del ruido (d = 0) la curva ROC se ve como una funci&oacuten de identidad (con AUC = 0.5), donde la probabilidad de obtener un Hit o una Falsa Alarma es exactamente la misma sin importar d&oacutende se localice el criterio. A mayor discriminabilidad, mayor ser&aacute la distancia entre la curva ROC correspondiente y la funci&oacuten identidad, con un AUC cada vez m&aacutes cercano a 1.0. En general, el AUC puede tomar valores entre 0.5 -un sistema que no distingue en lo absoluto entre la Se&ntildeal y el Ruido- y 1.0 -distinci&oacuten perfecta entre los mismos-.</h4>'),
                              HTML('<h2 style="text-align:justify; color:purple;"><b>Referencias</b></h2>'),
                              HTML('<h4 style="text-align:justify;"></h4>'),
                              HTML('<h4 style="text-align:justify;"></h4>'),
                              HTML('<br>')))),
      
      
      
############ ANALISIS NO PARAMETRICO
      tabItem(tabName = "nop",
              fluidRow(HTML('<h1 style="text-align:center; color:purple;"><b><u>Teor&iacutea de Detecci&oacuten de Se&ntildeales</u></b></h1>'),
                       HTML('<p style="text-align:center;"><b>por Adriana F. Ch&aacutevez</b></p>'),
                       tags$br(),
                       tags$br()),
              HTML('<h1 style="text-align:center;"><b>Secci&oacuten pendiente</b></h1>')),
      
      
      
      
      
      
      
############ ANALISIS PARAMETRICO
      tabItem(tabName = "para",
              fluidRow(HTML('<h1 style="text-align:center; color:purple;"><b><u>Teor&iacutea de Detecci&oacuten de Se&ntildeales</u></b></h1>'),
                       HTML('<p style="text-align:center;"><b>por Adriana F. Ch&aacutevez</b></p>')),
              fluidRow(column(width=8, offset = 2, background = 'yellow',
                              HTML('<h2 style="text-align:center; color:purple;"><b>Estimaci&oacuten param&eacutetrica</b></h2>'),
                              HTML('<hr style="border: 0; height: 1px; background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);"'),
                              HTML('<h4 style="text-align:justify;"></h4>'),
                              HTML('<h4 style="text-align:justify;"> A continuaci&oacuten se ilustra el c&oacutemputo de los par&aacutemetros comprendidos en la versi&oacuten est&aacutendar de la Teor&iacutea de Detecci&oacuten de Se&ntildeales, donde se asume que la variabilidad asociada con la Se&ntildeal y el Ruido puede ser descrita con <b>un par de distribuciones normales con varianzas iguales</b>, que se sobrelapan.</h4>'),
                              HTML('<h4 style="text-align:justify;"> Esto implica que despu&eacutes de haber realizado una <b>tarea de detecci&oacuten experimental</b> donde se ha expuesto a sujetos exprerimentales a una serie de ensayos aleatorios, donde s&oacutelo algunos conten&iacutean la se&ntildeal que se les solicit&oacute detectar, las <b>tasas de respuesta</b>, entendidas como la proporcion de ensayos en que se observ&oacute cada uno de los cuatro resultados posibles pueden ser utilizadas para estimar la estructura subyacente a la tarea.</h4>'),
                              HTML('<h4 style="text-align:justify;"> A t&iacutetulo personal, creo que es interesante se&ntildealar que toda la estimaci&oacuten param&eacutetrica deriva de los siguientes elementos, ideas o concepciones centrales:</h4>'),
                              HTML('<h4 style="text-align:justify;"> <b>1.</b> Las tasas de respuesta registradas en tareas de detecci&oacuten experimentales son interpretadas como el reflejo directo del &aacuterea de las distribuciones de Ruido y Se&ntildeal que caen a cada lado del criterio, por lo que fungen como materia prima para estimar 1) la localizaci&oacuten del criterio, 2) la distancia entre las distribuciones y 3) la preferencia o sesgo del sistema hacia una respuesta.</h4>'),
                              HTML('<h4 style="text-align:justify;"> <b>1.1</b> Las tasas de respuesta pueden ser agrupadas en parejas complementarias, estimadas a partir de un mismo total. Por ejemplo, la tasa de Falsas Alarmas y la tasa de Rechazos correctos son complementarias entre si, pues ambas representan los &uacutenicos resultados posibles de obtener al responder a un ensayo sin la se&ntildeal: o se acierta respondiendo "No", o se comete una Falsa alarma al responder "S&iacute". En este tutorial, utilizaremos <b>s&oacutelamente las tasas de Rechazos Correctos y Omisiones</b> para resumir el desempe&ntildeo observado en los sujetos experimentales.</h4>'),
                              HTML('<h4 style="text-align:justify;"> <b>2.</b> Para contar con un punto de referencia a partir del cual asignar una localizaci&oacuten sobre el "eje de la evidencia" (es decir, la base de las distribuciones de ruido y se&ntildeal), se asume que la distribuci&oacuten de ruido tiene una media = 0 y que su varianza es igual a la de la distribuci&oacuten de se&ntildeal (distribuci&oacuten est&aacutendar =  1). Con ello, la localizaci&oacuten de la distribuci&oacuten de se&ntildeal y el criterio sobre el eje de decisi&oacuten, pueden ser computadas utilizando como <b>las desviaciones est&aacutendar</b> como referencia (en este caso, usando los <b>puntajes Z como unidad</b>).</h4>'),
                              tags$br(),
                              HTML('<h2 style="text-align:center; color:purple;"><b>1. Criterio (k)</b></h2>'),
                              HTML('<h4 style="text-align:justify;"></h4>'),
                              HTML('<h4 style="text-align:justify;"> Asumiendo que la distribuci&oacuten de Ruido tiene una media en 0 y desviaci&oacuten est&aacutendar de 1, la localizaci&oacuten del criterio sobre el eje de evidencia puede estimarse a partir de la <b>tasa de rechazos correctos</b>.</h4>'),
                              HTML('<h4 style="text-align:justify;"> La localizaci&oacuten del criterio sobre el eje de evidencia queda capturada en el <b>par&aacutemetro k</b>, usando como unidad base <b>las desviaciones est&aacutendar</b> respecto de la media de la distribuci&oacuten de Ruido. Para ello, basta computar el <b>puntaje Z</b> que corresponde con la tasa de rechazos correctos para saber d&oacutende se localiza el criterio de elecci&oacuten, utilizando la desviaci&oacuten estanda como unidad de medida.</h4>'),
                              column(width=6, offset = 3,
                                     wellPanel(sliderInput(inputId="k_rej", 
                                                           label = "Tasa de Rechazos Correctos",
                                                           value=2, min=0.01, max=0.99,
                                                           step= 0.01))),
                              column(width=10, offset = 1,
                                     plotOutput(outputId="param_criterio"),
                                     tags$br()))),
              fluidRow(column(width=8, offset = 2, background = 'yellow',
                              tags$br(),
                              HTML('<h2 style="text-align:center; color:purple;"><b>2. Discriminabilidad (d)</b></h2>'),
                              HTML('<h4 style="text-align:justify;"></h4>'),
                              HTML('<h4 style="text-align:justify;"> La discriminabilidad de los est&iacutemulos comprometidos en la tarea de detecci&oacuten, se cuantifica con el <b>par&aacutemetro d</b> que representa <b>la distancia entre las medias de las distribuciones de ruido y se&ntildeal, en unidades de desviaci&oacuten est&aacutendar</b>.</h4>'),
                              HTML('<h4 style="text-align:justify;"> El c&oacutemputo de d se puede realizar <b>a partir de las tasas de omisiones y rechazos correctos</b>, de tal forma que la estimaci&oacuten de la media de la distribuci&oacuten de se&ntildeal puede entenderse a partir de los siguientes pasos, ilustrados de manera independiente en nuestro siguiente graficador:</h4>'),
                              HTML('<h4 style="text-align:justify;"> <b>1.- </b>Usamos la tasa de rechazos correctos como un indicador del &aacuterea de la distribuci&oacuten de ruido que ha ca&iacutedo por debajo del criterio. De esta forma, podemos estimar la distancia entre la media de la distribuci&oacuten de ruido y el criterio en unidades de desviaci&oacuten est&aacutendar, computando para ello el puntaje Z correspondiente. Una vez m&aacutes, el valor absoluto del puntaje Z resultante indica la distancia respecto de la media de la distribuci&oacuten de Ruido, mientras que el signo positivo o negativo indica la direcci&oacuten relativa del criterio por debajo o por encima de la misma. <b><i>Ver Panel A</i></b>.</h4>'),
                              HTML('<h4 style="text-align:justify;"> <b>2.- </b>Ahora, para determinar la distancia entre el criterio de elecci&oacuten y la media de la distribuci&oacuten de se&ntildeal, usamos la tasa de omisiones para saber cu&aacutel es el &aacuterea de esta distribuci&oacute que queda por debajo del criterio y computar el puntaje Z correspondiente. De esta forma, podemos saber la distancia y posici&oacuten relativa del criterio respecto de la media de la distribuci&oacuten de se&ntildeal.  <b><i>Ver Panel B</i></b>.</h4>'),
                              HTML('<h4 style="text-align:justify;"> <b>3.- </b>Finalmente, integramos la informaci&oacuten que tenemos acerca de la distancia entre el criterio y las medias de cada distribuci&oacuten mediante una resta simple: Restamos el Puntaje Z computado para la distribuci&oacute de Se&ntildeal (a partir de la tasa de omisiones) del Puntaje Z computado para la distribuci&oacuten de Ruido (a partir de la tasa de rechazos correctos). <b><i>Ver Panel C</i></b>.</h4>'))),
                       fluidRow(column(width=10, offset = 1,        
                       column(width=5, offset = 1,        
                                     wellPanel(sliderInput(inputId="d_rej", 
                                                           label = "Tasa de Rechazos Correctos*",
                                                           value=0.5, min=0.50, max=0.99,
                                                           step= 0.01))),
                              column(width=5, offset = 0,
                                     wellPanel(sliderInput(inputId="d_miss", 
                                                           label = "Tasa de Omisiones*",
                                                           value=0.5, min=0.01, max=0.50,
                                                           step= 0.01))),
                              column(width=5, offset = 1,
                                     plotOutput(outputId="param_discriminabilidad1"),
                                     tags$br()),
                              column(width=5, offset = 0,
                                     plotOutput(outputId="param_discriminabilidad2"),
                                     tags$br()),
                              column(width=10, offset = 1,
                                     plotOutput(outputId="param_discriminabilidad3"),
                                     tags$br()))),
              fluidRow(column(width=8, offset = 2, background = 'yellow',
                              HTML('<h4 style="text-align:justify;"><b>*</b> N&oacutetese que, a pesar de que las tasas de respuesta pueden tener como valor cualquier n&uacutemero real entre 0 y 1, para efectos de este graficador hemos restringido los valores de la tasa de Omisiones entre 0 y 0.5, y los valores de la tasa de Rechazos correctos entre 0.5 y 1.</h4>'),
                              tags$br(),
                              HTML('<h2 style="text-align:center; color:purple;"><b>3. Sesgo c</b></h2>'),
                              HTML('<h4 style="text-align:justify;"></h4>'),
                              HTML('<h4 style="text-align:justify;"> La discriminabilidad de los est&iacutemulos comprometidos en la tarea de detecci&oacuten, se cuantifica con el <b>par&aacutemetro d</b> que representa <b>la distancia entre las medias de las distribuciones de ruido y se&ntildeal, en unidades de desviaci&oacuten est&aacutendar</b>.</h4>'),
                              HTML('<h4 style="text-align:justify;"> El c&oacutemputo de d se puede realizar <b>a partir de las tasas de omisiones y rechazos correctos</b>, de tal forma que la estimaci&oacuten de la media de la distribuci&oacuten de se&ntildeal puede entenderse a partir de los siguientes pasos, ilustrados de manera independiente en nuestro siguiente graficador:</h4>'),
                              HTML('<h4 style="text-align:justify;"> <b>1.- </b>Usamos la tasa de rechazos correctos como un indicador del &aacuterea de la distribuci&oacuten de ruido que ha ca&iacutedo por debajo del criterio. De esta forma, podemos estimar la distancia entre la media de la distribuci&oacuten de ruido y el criterio en unidades de desviaci&oacuten est&aacutendar, computando para ello el puntaje Z correspondiente. Una vez m&aacutes, el valor absoluto del puntaje Z resultante indica la distancia respecto de la media de la distribuci&oacuten de Ruido, mientras que el signo positivo o negativo indica la direcci&oacuten relativa del criterio por debajo o por encima de la misma. <b><i>Ver Panel A</i></b>.</h4>'),
                              HTML('<h4 style="text-align:justify;"> <b>2.- </b>Ahora, para determinar la distancia entre el criterio de elecci&oacuten y la media de la distribuci&oacuten de se&ntildeal, usamos la tasa de omisiones para saber cu&aacutel es el &aacuterea de esta distribuci&oacute que queda por debajo del criterio y computar el puntaje Z correspondiente. De esta forma, podemos saber la distancia y posici&oacuten relativa del criterio respecto de la media de la distribuci&oacuten de se&ntildeal.  <b><i>Ver Panel B</i></b>.</h4>'),
                              HTML('<h4 style="text-align:justify;"> <b>3.- </b>Finalmente, integramos la informaci&oacuten que tenemos acerca de la distancia entre el criterio y las medias de cada distribuci&oacuten mediante una resta simple: Restamos el Puntaje Z computado para la distribuci&oacute de Se&ntildeal (a partir de la tasa de omisiones) del Puntaje Z computado para la distribuci&oacuten de Ruido (a partir de la tasa de rechazos correctos). <b><i>Ver Panel C</i></b>.</h4>'))),
              fluidRow(column(width=10, offset = 1,        
                              column(width=6, offset = 3,        
                                     wellPanel(sliderInput(inputId="c_crit", 
                                                           label = "Criterio",
                                                           value=1, min=-4, max=5,
                                                           step= 0.05))),
                              column(width=10, offset = 1,
                                     plotOutput(outputId="param_C"),
                                     tags$br()))),
              fluidRow(column(width=8, offset = 2, background = 'yellow',
                              tags$br(),
                              HTML('<h2 style="text-align:center; color:purple;"><b>3. Sesgo Beta</b></h2>'),
                              HTML('<h4 style="text-align:justify;"></h4>'),
                              HTML('<h4 style="text-align:justify;"> La discriminabilidad de los est&iacutemulos comprometidos en la tarea de detecci&oacuten, se cuantifica con el <b>par&aacutemetro d</b> que representa <b>la distancia entre las medias de las distribuciones de ruido y se&ntildeal, en unidades de desviaci&oacuten est&aacutendar</b>.</h4>'),
                              HTML('<h4 style="text-align:justify;"> El c&oacutemputo de d se puede realizar <b>a partir de las tasas de omisiones y rechazos correctos</b>, de tal forma que la estimaci&oacuten de la media de la distribuci&oacuten de se&ntildeal puede entenderse a partir de los siguientes pasos, ilustrados de manera independiente en nuestro siguiente graficador:</h4>'),
                              HTML('<h4 style="text-align:justify;"> <b>1.- </b>Usamos la tasa de rechazos correctos como un indicador del &aacuterea de la distribuci&oacuten de ruido que ha ca&iacutedo por debajo del criterio. De esta forma, podemos estimar la distancia entre la media de la distribuci&oacuten de ruido y el criterio en unidades de desviaci&oacuten est&aacutendar, computando para ello el puntaje Z correspondiente. Una vez m&aacutes, el valor absoluto del puntaje Z resultante indica la distancia respecto de la media de la distribuci&oacuten de Ruido, mientras que el signo positivo o negativo indica la direcci&oacuten relativa del criterio por debajo o por encima de la misma. <b><i>Ver Panel A</i></b>.</h4>'),
                              HTML('<h4 style="text-align:justify;"> <b>2.- </b>Ahora, para determinar la distancia entre el criterio de elecci&oacuten y la media de la distribuci&oacuten de se&ntildeal, usamos la tasa de omisiones para saber cu&aacutel es el &aacuterea de esta distribuci&oacute que queda por debajo del criterio y computar el puntaje Z correspondiente. De esta forma, podemos saber la distancia y posici&oacuten relativa del criterio respecto de la media de la distribuci&oacuten de se&ntildeal.  <b><i>Ver Panel B</i></b>.</h4>'),
                              HTML('<h4 style="text-align:justify;"> <b>3.- </b>Finalmente, integramos la informaci&oacuten que tenemos acerca de la distancia entre el criterio y las medias de cada distribuci&oacuten mediante una resta simple: Restamos el Puntaje Z computado para la distribuci&oacute de Se&ntildeal (a partir de la tasa de omisiones) del Puntaje Z computado para la distribuci&oacuten de Ruido (a partir de la tasa de rechazos correctos). <b><i>Ver Panel C</i></b>.</h4>'))),
            fluidRow(column(width=10, offset = 1,        
                              column(width=6, offset = 3,        
                                     wellPanel(sliderInput(inputId="beta_crit", 
                                                           label = "Criterio",
                                                           value=1, min=-4, max=5,
                                                           step= 0.05))),
                              column(width=10, offset = 1,
                                     plotOutput(outputId="param_beta"),
                                     tags$br()))),
            fluidRow(column(width=10, offset = 1,   
            HTML('<h2 style="text-align:justify; color:purple;"><b>Referencias</b></h2>'),
            HTML('<h4 style="text-align:justify;"><b>1. </b> Stainslaw, H., y Todorov, N. (1999). Calculation of signal detection theory measures.Behavior ResearchMethods, Instruments and Computers, 31(1), 137-149.</h4>'),
            HTML('<h4 style="text-align:justify;"><b>2. </b> Gescheider, G. A. (2013). Psychophysics: The fundamentals (3rd Edition; Psychology Press, Ed.).</h4>'),
            HTML('<h4 style="text-align:justify;"></h4>')))))))


server <- function(input, output) {
  

  output$sdt_inicial_d <- renderPlot({plot(10, 20, main="", xlab="", ylab="",type='l',
                                         font.lab=2, axes = "FALSE", xlim= c(-4,6),  ylim= c(0,.45),  col="darkorchid3", lwd=2)
    lines(seq(-10,10,.05),dnorm(seq(-10,10,.05),0,1),type='l', lwd=2, lty=1, col='black') #NOISE
    lines(seq(-10,10,.05),dnorm(seq(-10,10,.05),input$disc,1),type='l', lwd=2, lty=1, col='black') #SIGNAL
    lines(c(0,0), c(0,0.4))
    lines(c(input$disc,input$disc), c(0,0.4))
    axis(1,at=c(-4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6), labels=c("", "", "", "", "", "", "", "", "", "", ""), font=2)
    lines(c(0,input$disc),c(0.18,0.18), lwd=4, col="darkorchid3")
    text(-0.5,.13,expression(paste(mu,"R")),cex=1.5,col='black',f=2)
    text(input$disc+0.5,.13,expression(paste(mu,"S")),cex=1.5,col='black',f=2)
    text(0,.43,"Ruido",cex=1.2,col='black',f=2)
    text(input$disc,.43,"Se\u{00F1}al",cex=1.2,col='black',f=2)
    mtext("Evidencia evaluada",1,cex=2, line=3, f=2)})
  
  
  
  
  output$sdt_inicial_k <- renderPlot({plot(10, 20, main="", xlab="", ylab="",type='l',
                                    font.lab=2, axes = "FALSE", xlim= c(-4,5),  ylim= c(0,.5),  col="darkorchid3", lwd=2)
    lines(seq(input$crit,10,.05),dnorm(seq(input$crit,10,.05),2,1),type='l', lwd=4, col='forestgreen') #Hit
    lines(seq(input$crit,10,.05),dnorm(seq(input$crit,10,.05),0,1),type='l', lwd=4, col='firebrick3') #FA
    lines(seq(-10,input$crit,.05),dnorm(seq(-10,input$crit,.05),0,1),type='l', lwd=4, col='dodgerblue3') #Rej
    lines(seq(-10,input$crit,.05),dnorm(seq(-10,input$crit,.05),2,1),type='l', lwd=4, col='darkorchid3') #Miss
    lines(seq(-10,10,.05),dnorm(seq(-10,10,.05),0,1),type='l', lwd=1, lty=3, col='white') #NOISE
    lines(seq(-10,10,.05),dnorm(seq(-10,10,.05),2,1),type='l', lwd=1, lty=3, col='white') #SIGNAL
    axis(1,at=c(-4, -3, -2, -1, 0, 1, 2, 3, 4, 5), labels=c("", "", "", "", "", "", "", "", "", ""), font=2)
    abline(v=input$crit, lwd=3)
    text(-2.4,.5,"Probabilidad de:",cex=1,col='black',f=2)
    text(-2.4,.46,paste("Hit= ",round(pnorm(input$crit,2,1,lower.tail=FALSE),3)), cex=1, col='forestgreen', f=2) 
    text(-2.4,.34,paste("Omisi\u{00F3}n= ",round(pnorm(input$crit,2,1,lower.tail=TRUE),3)), cex=1, col='darkorchid3', f=2) 
    text(-2.4,.42,paste("Falsa Alarma= ",round(pnorm(input$crit,0,1,lower.tail=FALSE),3)), cex=1, col='firebrick3', f=2) 
    text(-2.4,.38,paste("Rechazo Correcto= ",round(pnorm(input$crit,0,1,lower.tail=TRUE),3)), cex=1, col='dodgerblue3', f=2) 
    text(0,.43,"Ruido",cex=1.5,col='black',f=2)
    text(2,.43,"Se\u{00F1}al",cex=1.5,col='black',f=2)
    mtext("Evidencia evaluada",1,cex=3, line=3, f=2)})
  
  output$roc_sdt <- renderPlot({plot(10, 20, main="", xlab="", ylab="",type='l',
                                         font.lab=2, axes = "FALSE", xlim= c(-4,5),  ylim= c(0,.5),  col="darkorchid3", lwd=2)
    lines(seq(input$k_roc,10,.05),dnorm(seq(input$k_roc,10,.05),input$d_roc,1),type='l', lwd=3, col='forestgreen') #Hit
    lines(seq(input$k_roc,10,.05),dnorm(seq(input$k_roc,10,.05),0,1),type='l', lwd=3, col='firebrick3') #FA
    lines(seq(-10,input$k_roc,.05),dnorm(seq(-10,input$k_roc,.05),0,1),type='l', lwd=3, col='black') #Rej
    lines(seq(-10,input$k_roc,.05),dnorm(seq(-10,input$k_roc,.05),input$d_roc,1),type='l', lwd=3, col='black') #Miss
    lines(seq(-10,10,.05),dnorm(seq(-10,10,.05),0,1),type='l', lwd=1, lty=3, col='white') #NOISE
    lines(seq(-10,10,.05),dnorm(seq(-10,10,.05),2,1),type='l', lwd=1, lty=3, col='white') #SIGNAL
    lines(c(0,0), c(0,0.4))
    lines(c(input$d_roc,input$d_roc), c(0,0.4))
    axis(1,at=c(-4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6), labels=c("", "", "", "", "", "", "", "", "", "", ""), font=2)
    lines(c(0,input$d_roc),c(0.18,0.18), lwd=4, col="darkorchid3")
    text(-0.5,.13,expression(paste(mu,"R")),cex=1.5,col='black',f=2)
    text(input$d_roc+0.5,.13,expression(paste(mu,"S")),cex=1.5,col='black',f=2)
    lines(c(input$k_roc,input$k_roc), c(0,0.43), lwd=4, col="goldenrod4")
    text(-2.4,.5,"Probabilidad de:",cex=1,col='black',f=2)
    text(-2.4,.46,paste("Hit= ",round(pnorm(input$k_roc,2,1,lower.tail=FALSE),3)), cex=1, col='forestgreen', f=2) 
    #text(-3.1,.34,paste("Omisi\u{00F3}n= ",round(pnorm(input$k_roc,2,1,lower.tail=TRUE),3)), cex=1, col='darkorchid3', f=2) 
    text(-2.6,.43,paste("F.A.= ",round(pnorm(input$k_roc,0,1,lower.tail=FALSE),3)), cex=1, col='firebrick3', f=2) 
    #text(-3.1,.38,paste("Rechazo Correcto= ",round(pnorm(input$k_roc,0,1,lower.tail=TRUE),3)), cex=1, col='dodgerblue3', f=2) 
    text(0,.43,"Ruido",cex=1.5,col='black',f=2)
    text(2,.43,"Se\u{00F1}al",cex=1.5,col='black',f=2)
    mtext("Evidencia evaluada",1,cex=1.5, line=3, f=2)})
  
  
  
  bias_c <- seq(-10,10,0.05) 
  d_null <- 0  
  hits_na <- c()     
  falarms_na <- c()  
  for (i in 1:length(bias_c)){
  hits_na[i] <- pnorm((d_null/2)-bias_c[i])      
  falarms_na[i] <- pnorm((-d_null/2)-bias_c[i])
  }
  
  output$roc_sdt2 <- renderPlot({
    plot(.5,.5, pch=16, col='white', xlim=c(0,1), ylim=c(0,1), xlab='F.A. Rate', ylab='Hit Rate')    
    lines(pnorm((-(input$d_roc)/2)-bias_c), pnorm((input$d_roc/2)-bias_c), lwd=2, col='darkorchid3')   
    lines(hits_na,falarms_na,lwd=1,col='black', lty=2) 
    lines(c(0.38, 0.48),c(0.2,0.2), lwd=2, lty=1, col="deepskyblue3")      
    points(0.43,0.1, lty=3, pch=16, col='deepskyblue4')
    points(pnorm(input$k_roc,input$d_roc,1), pnorm(input$k_roc,0,1),  cex=2, lty=3, pch=16, col='goldenrod4')
    text(0.5, 0.2, labels="Combinaciones posibles Hits-F.A. por d'", offset=0, cex = 0.7, pos=4)
    text(0.5, 0.1, labels="Tasas de Hits y F.A. asociados con k", offset=0, cex = 0.7, pos=4)
    text(0.85, 0.83, labels="d' = 0", offset=0, cex = 0.8, pos=4)
    #text(fa_rate-0.13, h_rate+0.02, paste("d' =", d), offset=0, cex = 0.8, pos=4)
    title('ROC')})
  
  
  
  
  
  output$param_criterio <- renderPlot({plot(10, 20, main="", xlab="", ylab="",type='l',
                                           font.lab=2, axes = "FALSE", xlim= c(-4,5),  ylim= c(0,.5),  col="darkorchid3", lwd=2)
    lines(seq(qnorm(input$k_rej, 0,1),10,.05),dnorm(seq(qnorm(input$k_rej, 0,1),10,.05),0,1),type='l', lwd=4, col='firebrick3') #FA
    lines(seq(-10,qnorm(input$k_rej, 0,1),.05),dnorm(seq(-10,qnorm(input$k_rej, 0,1),.05),0,1),type='l', lwd=4, col='dodgerblue3') #Rej
    lines(seq(-10,10,.05),dnorm(seq(-10,10,.05),0,1),type='l', lwd=1, lty=3, col='white') #NOISE
    lines(seq(-10,10,.05),dnorm(seq(-10,10,.05),2,1),type='l', lwd=1, lty=2, col='black') 
    axis(1,at=c(-4, -3, -2, -1, 0, 1, 2, 3, 4, 5), labels=c("", "", "", "", "0", "", "", "", "", ""), font=2)
    lines(c(0,0), c(0,0.45), lwd=2, lty=3)
    lines(c(0,qnorm(input$k_rej, 0,1)), c(0.05,0.05), lwd=2, lty=3)
    abline(v=qnorm(input$k_rej, 0,1), lwd=2)
    text(-2.9,.47,"Tasas de respuesta:",cex=1,col='black',f=2)
    text(-3.1,.42,paste("Falsa Alarma= ",round(pnorm(qnorm(input$k_rej, 0,1),0,1,lower.tail=FALSE),3)), cex=1, col='firebrick3', f=1) 
    text(-2.9,.38,paste("Rechazo Correcto= ",round(pnorm(qnorm(input$k_rej, 0,1),0,1,lower.tail=TRUE),3)), cex=1, col='dodgerblue3', f=1) 
    text(-3.1,.30,paste("k = ",round(qnorm(input$k_rej, 0,1),3)), cex=2, col='black', f=2) 
    text(qnorm(input$k_rej, 0,1)/2,.08,paste("Z = ",round(qnorm(input$k_rej, 0,1),3)), cex=1, col='black', f=2) 
    text(0,.43,"Ruido",cex=1.5,col='black',f=2)
    text(2,.43,"Se\u{00F1}al",cex=1.5,col='black',f=1)
    mtext("Evidencia evaluada",1,cex=1.5, line=3, f=2)})
  
  
  output$param_discriminabilidad1 <- renderPlot({plot(10, 20, main="", xlab="", ylab="",type='l',
                                            font.lab=2, axes = "FALSE", xlim= c(-4,5),  ylim= c(0,.5),  col="white", lwd=2)
    lines(seq(qnorm(input$d_rej, 0,1),10,.05),dnorm(seq(qnorm(input$d_rej, 0,1),10,.05),0,1),type='l', lwd=4, col='black') #FA
    lines(seq(-10,qnorm(input$d_rej, 0,1),.05),dnorm(seq(-10,qnorm(input$d_rej, 0,1),.05),0,1),type='l', lwd=4, col='dodgerblue3') #Rej
    lines(seq(-10,10,.05),dnorm(seq(-10,10,.05),0,1),type='l', lwd=1, lty=3, col='white') #NOISE
    #lines(seq(-10,10,.05),dnorm(seq(-10,10,.05),2,1),type='l', lwd=1, lty=2, col='black') 
    axis(1,at=c(-4, -3, -2, -1, 0, 1, 2, 3, 4, 5), labels=c("", "", "", "", "0", "", "", "", "", ""), font=2)
    lines(c(0,0), c(0,0.45), lwd=2, lty=3)
    lines(c(0,qnorm(input$d_rej, 0,1)), c(0.05,0.05), lwd=2, lty=3)
    abline(v=qnorm(input$d_rej, 0,1), lwd=2, col="dodgerblue3")
    text(-2.9,.5,"Tasas de respuesta:",cex=1,col='black',f=2)
    text(-2.9,.47,paste("Rechazo Correcto= ",round(pnorm(qnorm(input$d_rej, 0,1),0,1,lower.tail=TRUE),3)), cex=1, col='dodgerblue3', f=1) 
    text(-2.9,.35,"Distancia entre el criterio", cex=1, col='black', f=2) 
    text(-2.9,.32,"y la media Ruido", cex=1, col='black', f=2)
    text(-2.8,.27,paste("Puntaje Z = ",round(qnorm(input$d_rej, 0,1),3)), cex=1.5, col='black', f=2) 
    text(4.5,0.49,"Panel A",cex=1.5,col='black',f=2)
    text(0,.43,"Ruido",cex=1.5,col='black',f=2)
    #text(2,.43,"Se\u{00F1}al",cex=1.5,col='black',f=1)
    mtext("Evidencia evaluada",1,cex=1.5, line=3, f=2)})
  
  
  output$param_discriminabilidad2 <- renderPlot({plot(10, 20, main="", xlab="", ylab="",type='l',
                                            font.lab=2, axes = "FALSE", xlim= c(-4,5),  ylim= c(0,.5),  col="white", lwd=2)
    lines(seq(qnorm(input$d_miss,0,1),10,.05),dnorm(seq(qnorm(input$d_miss, 0,1),10,.05),2,1),type='l', lwd=4, col='black') #FA
    lines(seq(-10,(qnorm(input$d_miss,0,1)+2),.05),dnorm(seq(-10,(qnorm(input$d_miss,0,1)+2),.05),2,1),type='l', lwd=4, col='darkorchid3') #Miss
    #lines(seq(-10,10,.05),dnorm(seq(-10,10,.05),0,1),type='l', lwd=1, lty=2, col='black') #NOISE
    lines(seq(-10,10,.05),dnorm(seq(-10,10,.05),2,1),type='l', lwd=1, lty=3, col='white') 
    axis(1,at=c(-4, -3, -2, -1, 0, 1, 2, 3, 4, 5), labels=c("", "", "", "", "", "", "?", "", "", ""), font=2)
    abline(v=2+qnorm(input$d_miss, 0,1), lwd=2, col="darkorchid3")
    lines(c(2,2), c(0,0.45), lwd=2, lty=3)
    lines(c(2,(qnorm(input$d_miss, 0,1)+2)), c(0.05,0.05), lwd=2, lty=3)
    text(-2.9,.5,"Tasas de respuesta:",cex=1,col='black',f=2)
    text(-2.9,.47,paste("Omisiones= ",round(pnorm(qnorm(input$d_miss, 0,1),0,1,lower.tail=TRUE),3)), cex=1, col='darkorchid3', f=1) 
    text(-2.9,.35,"Distancia entre el criterio", cex=1, col='black', f=2) 
    text(-2.9,.32,"y la media Senal", cex=1, col='black', f=2)
    text(-2.8,.27,paste("Puntaje Z = ",round(qnorm(input$d_miss, 0,1),3)), cex=1.5, col='black', f=2) 
    text(4.5,0.49,"Panel B",cex=1.5,col='black',f=2)
    #text(0,.43,"Ruido",cex=1.5,col='black',f=2)
    text(2,.43,"Se\u{00F1}al",cex=1.5,col='black',f=2)
    mtext("Evidencia evaluada",1,cex=1.5, line=3, f=1)})
  
  param_d <- reactive({qnorm(input$d_rej,0,1)-qnorm(input$d_miss,0,1)})
  
  output$param_discriminabilidad3 <- renderPlot({plot(10, 20, main="", xlab="", ylab="",type='l',
                                            font.lab=2, axes = "FALSE", xlim= c(-4,5),  ylim= c(0,.5),  col="white", lwd=2)
    lines(seq(-10,10,.05),dnorm(seq(-10,10,.05),0,1),type='l', lwd=3, lty=1, col='cornflowerblue') #NOISE
    lines(seq(-10,10,.05),dnorm(seq(-10,10,.05),param_d(),1),type='l', lwd=3, lty=1, col='blueviolet') #Signal
    lines(seq(-10,qnorm(input$d_rej, 0,1),.05),dnorm(seq(-10,qnorm(input$d_rej, 0,1),.05),0,1),type='l', lwd=4, col='deepskyblue4') #Rej
    lines(seq(-10,(qnorm(input$d_miss,0,1)+param_d()),.05),dnorm(seq(-10,(qnorm(input$d_miss,0,1)+param_d()),.05),param_d(),1),type='l', lwd=4, col='darkorchid4') #Miss
    axis(1,at=c(-4, -3, -2, -1, 0, 1, 2, 3, 4, 5), labels=c("", "", "", "", "", "", "", "", "", ""), font=2)
    abline(v=qnorm(input$d_rej, 0,1), lwd=3, lty=1, col="dodgerblue3")
    abline(v=qnorm(input$d_rej, 0,1), lwd=3, lty=3, col="darkorchid3")
    #text(-2.9,.5,"Tasas de respuesta:",cex=1,col='black',f=2)
    #text(-3.1,.42,paste("Falsa Alarma= ",round(pnorm(qnorm(input$k_rej, 0,1),0,1,lower.tail=FALSE),3)), cex=1, col='firebrick3', f=1) 
    #text(-2.6,.38,paste("Rechazo Correcto= ",round(pnorm(qnorm(input$k_rej, 0,1),0,1,lower.tail=TRUE),3)), cex=1, col='dodgerblue3', f=1) 
    #text(-3.1,.34,paste("k = ",round(qnorm(input$k_rej, 0,1),3)), cex=1, col='black', f=2) 
    text(4.5,0.49,"Panel C",cex=1.5,col='black',f=2)
    text(0,.43,"Ruido",cex=1.5,col='black',f=2)
    text(param_d(),.43,"Se\u{00F1}al",cex=1.5,col='black',f=2)
    mtext("Evidencia evaluada",1,cex=1.5, line=3, f=2)})
  
  
  output$param_C <- renderPlot({plot(10, 20, main="", xlab="", ylab="",type='l',
                                           font.lab=2, axes = "FALSE", xlim= c(-4,5),  ylim= c(0,.47),  col="darkorchid3", lwd=2)
    lines(seq(input$c_crit,10,.05),dnorm(seq(input$c_crit,10,.05),2,1),type='l', lwd=3, col='black') #Hit
    lines(seq(input$c_crit,10,.05),dnorm(seq(input$c_crit,10,.05),0,1),type='l', lwd=3, col='black') #FA
    lines(seq(-10,input$c_crit,.05),dnorm(seq(-10,input$c_crit,.05),0,1),type='l', lwd=3, col='gray54') #Rej
    lines(seq(-10,input$c_crit,.05),dnorm(seq(-10,input$c_crit,.05),2,1),type='l', lwd=3, col='gray54') #Miss
    lines(seq(-10,10,.05),dnorm(seq(-10,10,.05),0,1),type='l', lwd=1, lty=3, col='white') #NOISE
    lines(seq(-10,10,.05),dnorm(seq(-10,10,.05),2,1),type='l', lwd=1, lty=3, col='white') #SIGNAL
    axis(1,at=c(-4, -3, -2, -1, 0, 1, 2, 3, 4, 5), labels=c("", "-3", "-2", "-1", "0", "1", "2", "3", "", ""), font=2)
    lines(c(0,0), c(0,0.4), lwd=1, col="gray63", lty=4)
    lines(c(2,2), c(0,0.4), lwd=1, col="gray63", lty=4)
    lines(c(input$c_crit,input$c_crit), c(0,0.41), lwd=3)
    lines(c(1,1), c(0,0.41), lwd=3, col="red", lty=2)
    lines(c(1,input$c_crit), c(0.2,0.2), col="red", lwd=2)
    #text(-2.9,.5,"Probabilidad de cometer un(a):",cex=1,col='black',f=2)
    #text(-3.1,.46,paste("Hit= ",round(pnorm(input$crit,2,1,lower.tail=FALSE),3)), cex=1, col='forestgreen', f=2) 
    #text(-3.1,.34,paste("Omisi\u{00F3}n= ",round(pnorm(input$crit,2,1,lower.tail=TRUE),3)), cex=1, col='darkorchid3', f=2) 
    #text(-3.1,.42,paste("Falsa Alarma= ",round(pnorm(input$crit,0,1,lower.tail=FALSE),3)), cex=1, col='firebrick3', f=2) 
    #text(-3.1,.38,paste("Rechazo Correcto= ",round(pnorm(input$crit,0,1,lower.tail=TRUE),3)), cex=1, col='dodgerblue3', f=2) 
    text(-3.1,.30,paste("C = ",round(input$c_crit-1,3)), cex=2, col='black', f=2) 
    text(input$c_crit+0.5,.25,"Si",cex=1.5,col='black',f=2)
    text(input$c_crit-0.5,.25,"No",cex=1.5,col='gray28',f=2)
    text(0,.43,"Ruido",cex=1.5,col='black',f=2)
    text(2,.43,"Se\u{00F1}al",cex=1.5,col='black',f=2)
    mtext("Evidencia evaluada",1,cex=1.5, line=3, f=2)})
  
  output$param_beta <- renderPlot({plot(10, 20, main="", xlab="", ylab="",type='l',
                                           font.lab=2, axes = "FALSE", xlim= c(-4,5),  ylim= c(0,.47),  col="darkorchid3", lwd=2)
    lines(seq(input$beta_crit,10,.05),dnorm(seq(input$beta_crit,10,.05),2,1),type='l', lwd=4, col='black') #Hit
    lines(seq(input$beta_crit,10,.05),dnorm(seq(input$beta_crit,10,.05),0,1),type='l', lwd=4, col='black') #FA
    lines(seq(-10,input$beta_crit,.05),dnorm(seq(-10,input$beta_crit,.05),0,1),type='l', lwd=4, col='gray54') #Rej
    lines(seq(-10,input$beta_crit,.05),dnorm(seq(-10,input$beta_crit,.05),2,1),type='l', lwd=4, col='gray54') #Miss
    lines(seq(-10,10,.05),dnorm(seq(-10,10,.05),0,1),type='l', lwd=1, lty=3, col='white') #NOISE
    lines(seq(-10,10,.05),dnorm(seq(-10,10,.05),2,1),type='l', lwd=1, lty=3, col='white') #SIGNAL
    axis(1,at=c(-4, -3, -2, -1, 0, 1, 2, 3, 4, 5), labels=c("", "", "", "", "", "", "", "", "", ""), font=2)
    lines(c(0,0), c(0,0.4), lwd=1, col="gray63", lty=4)
    lines(c(2,2), c(0,0.4), lwd=1, col="gray63", lty=4)
    lines(c(input$beta_crit,input$beta_crit),c(0,0.4), lwd=2)
    points(input$beta_crit, dnorm(input$beta_crit,2,1), col="red", pch=16, cex=2)
    points(input$beta_crit, dnorm(input$beta_crit,0,1), col="blue", pch=15, cex=2)
    #text(-2.9,.5,"Probabilidad de cometer un(a):",cex=1,col='black',f=2)
    #text(-3.1,.46,paste("Hit= ",round(pnorm(input$crit,2,1,lower.tail=FALSE),3)), cex=1, col='forestgreen', f=2) 
    #text(-3.1,.34,paste("Omisi\u{00F3}n= ",round(pnorm(input$crit,2,1,lower.tail=TRUE),3)), cex=1, col='darkorchid3', f=2) 
    #text(-3.1,.42,paste("Falsa Alarma= ",round(pnorm(input$crit,0,1,lower.tail=FALSE),3)), cex=1, col='firebrick3', f=2) 
    #text(-3.1,.38,paste("Rechazo Correcto= ",round(pnorm(input$crit,0,1,lower.tail=TRUE),3)), cex=1, col='dodgerblue3', f=2) 
    text(input$beta_crit+0.5,.25,"Si",cex=1.5,col='black',f=2)
    text(input$beta_crit-0.5,.25,"No",cex=1.5,col='gray28',f=2)
    text(0,.43,"Ruido",cex=1.5,col='black',f=2)
    text(2,.43,"Se\u{00F1}al",cex=1.5,col='black',f=2)
    mtext("Evidencia evaluada",1,cex=1.5, line=3, f=2)})
  
  
  
  
  
  
}



shinyApp(ui, server)