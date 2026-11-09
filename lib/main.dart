// ignore_for_file: avoid_print
// ============================================================================
// UNIVERSIDAD AGRARIA DEL ECUADOR
// CARRERA: CIENCIAS DE LA COMPUTACIÓN – MODALIDAD EN LÍNEA
// Materia: Lenguaje de Programación 5 - Sexto Semestre
// Profesor: Ing. Bryan Vélez MSc.
// TALLER 4 - SEMANA 4: Formulario de Ingreso de Correo en Flutter (Multiplataforma)
// Integrantes: Juan Silva, Helen Silva y Katherine Morante
// ============================================================================
//
// PÁRRAFO COMPARATIVO: NATIVO ANDROID (XML + JAVA/KOTLIN) VS. FLUTTER (DART)
// ----------------------------------------------------------------------------
// En el desarrollo nativo de Android tradicional (Semana 3), la interfaz de usuario
// se define de forma imperativa utilizando archivos XML (como activity_main.xml) y
// la lógica de control en archivos Java/Kotlin separados. Para vincular ambos mundos,
// es obligatorio enlazar cada elemento gráfico mediante `findViewById` o ViewBinding y
// actualizar la pantalla invocando explícitamente métodos como `setText()`.
//
// Por el contrario, en Flutter (Semana 4), NO existen archivos XML ni `findViewById`.
// Toda la aplicación (interfaz y lógica) se construye de manera declarativa en un único
// archivo (`lib/main.dart`) utilizando el lenguaje Dart mediante un árbol de widgets
// anidados (`Scaffold`, `Padding`, `Column`, `TextField`, `ElevatedButton`).
// La gestión de la pantalla se realiza mediante un `StatefulWidget`: la captura de texto
// se delega a un `TextEditingController` y la actualización visual no modifica elementos
// manualmente, sino que invoca a `setState(() { ... })`, lo cual notifica a Flutter para
// redibujar los widgets afectados. Además, Flutter incluye Hot Reload, lo que permite
// observar cambios en la interfaz en menos de un segundo sin perder el estado de la app.
// ============================================================================

// Importación del paquete principal de Material Design para construir la interfaz gráfica.
import 'package:flutter/material.dart';

// Función principal void main() que actúa como punto de entrada de la aplicación.
void main() {
  // Inicializa la ejecución de la app cargando el widget raíz FormularioCorreoUAE.
  runApp(const FormularioCorreoUAE());
}

// Clase principal de la app que hereda de StatelessWidget (widget sin estado mutable propio).
class FormularioCorreoUAE extends StatelessWidget {
  // Constructor constante de la clase para optimizar el rendimiento en el árbol de widgets.
  const FormularioCorreoUAE({super.key});

  // Método build que construye el widget raíz de la aplicación.
  @override
  Widget build(BuildContext context) {
    // Retorna la estructura principal MaterialApp con configuraciones globales de tema.
    return MaterialApp(
      // Desactiva la etiqueta emergente 'DEBUG' en la esquina superior derecha.
      debugShowCheckedModeBanner: false,
      // Define el título identificador de la aplicación.
      title: 'Formulario Correo UAE',
      // Configuración del tema gráfico global de la aplicación.
      theme: ThemeData(
        // Define la paleta de colores a partir de un color semilla azul.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        // Habilita el diseño de componentes con especificación Material 3.
        useMaterial3: true,
      ),
      // Establece la pantalla de inicio llamando a FormularioCorreoPage.
      home: const FormularioCorreoPage(),
    );
  }
}

// Widget con estado mutable (StatefulWidget) que permite interacción y redibujado en pantalla.
class FormularioCorreoPage extends StatefulWidget {
  // Constructor constante para FormularioCorreoPage.
  const FormularioCorreoPage({super.key});

  // Sobrescribe la creación del estado asociando la clase _FormularioCorreoPageState.
  @override
  State<FormularioCorreoPage> createState() => _FormularioCorreoPageState();
}

// Clase de estado donde vive la lógica de negocio, variables de estado y la interfaz.
class _FormularioCorreoPageState extends State<FormularioCorreoPage> {
  // Declaración del TextEditingController para capturar el texto del campo (sustituye EditText + findViewById).
  final TextEditingController _ctrl = TextEditingController();

  // Variable de estado String para guardar el resultado a mostrar en la pantalla.
  String _resultado = '';

  // Método del ciclo de vida para liberar recursos de memoria al destruir el widget.
  @override
  void dispose() {
    // Libera el controlador de texto de la memoria para prevenir fugas de recursos.
    _ctrl.dispose();
    // Ejecuta el método dispose de la clase base State.
    super.dispose();
  }

  // Función encargada de procesar la entrada del usuario al presionar el botón "Enviar".
  void _procesarFormulario() {
    // Imprime en consola un encabezado para señalar el inicio de la acción.
    print('==================================================');
    // Imprime en consola que se ha presionado el botón Enviar.
    print('EVENTO: El usuario pulsó el botón "Enviar".');

    // Obtiene el texto del controlador _ctrl.text eliminando espacios iniciales y finales.
    final String correoIngresado = _ctrl.text.trim();

    // Imprime en la consola de depuración el valor obtenido del campo de texto.
    print('DATO CAPTURADO (_ctrl.text): "$correoIngresado"');

    // Validación de entrada: comprueba si el campo de texto se encuentra vacío.
    if (correoIngresado.isEmpty) {
      // Imprime mensaje en consola indicando que la validación detectó un campo vacío.
      print('VALIDACIÓN: El campo está vacío. Se requiere ingresar un correo.');

      // Actualiza el estado dentro de setState para reflejar el aviso en la pantalla.
      setState(() {
        // Asigna un mensaje de advertencia a la variable de estado _resultado.
        _resultado = 'Por favor, ingresa tu correo electrónico.';
      });

      // Imprime en consola la confirmación de la actualización mediante setState.
      print('ESTADO ACTUALIZADO (setState): Se mostró mensaje de advertencia.');
    } else {
      // Imprime en consola que el correo fue validado exitosamente.
      print('VALIDACIÓN: Correo ingresado correcto -> $correoIngresado');

      // Actualiza el estado DENTRO de setState(() { ... }) para que la pantalla se redibuje.
      setState(() {
        // Guarda el resultado formateado que será visible en la interfaz.
        _resultado = 'Correo ingresado:\n$correoIngresado';
      });

      // Imprime en la consola que setState ha redibujado la pantalla con el nuevo resultado.
      print('ESTADO ACTUALIZADO (setState): Pantalla redibujada con el correo ingresado.');
    }

    // Imprime en consola el cierre de la secuencia de ejecución.
    print('==================================================');
  }

  // Método build para construir la jerarquía visual de widgets de la pantalla.
  @override
  Widget build(BuildContext context) {
    // Imprime en consola cada vez que el método build se ejecuta para redibujar la vista.
    print('BUILD: Construyendo árbol de widgets de la pantalla.');

    // Retorna la estructura principal de la pantalla mediante Scaffold.
    return Scaffold(
      // Configuración de la barra superior de navegación y título (AppBar).
      appBar: AppBar(
        // Color de fondo de la barra de título (Azul).
        backgroundColor: Colors.blue,
        // Título visual de la barra de la aplicación.
        title: const Text(
          // Texto del título mostrado en la AppBar.
          'Formulario de correo',
          // Estilo de texto con letra blanca y peso negrita.
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        // Centra el título en la barra superior.
        centerTitle: true,
      ),
      // Cuerpo principal de la pantalla envuelto en Padding para márgenes internos.
      body: Padding(
        // Aplica un margen interno (padding) de 20 píxeles alrededor del contenido.
        padding: const EdgeInsets.all(20.0),
        // Organiza los elementos verticales anidados secuencialmente mediante Column.
        child: Column(
          // Estira los widgets hijos horizontalmente a todo el ancho disponible.
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // Lista de widgets hijos anidados dentro de la columna.
          children: [
            // Texto de etiqueta ("Ingresa tu correo").
            const Text(
              // Contenido textual de la etiqueta de instrucción.
              'Ingresa tu correo',
              // Configuración de estilo visual con tamaño 18 y negrita.
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            // Widget SizedBox utilizado como separador (cumple el papel del margin en Android).
            const SizedBox(height: 12),
            // Campo de entrada de texto (TextField) para capturar el correo electrónico.
            TextField(
              // Conecta el TextEditingController declarados para capturar la entrada.
              controller: _ctrl,
              // Configura el teclado virtual para optimizar el ingreso de correos electrónicos.
              keyboardType: TextInputType.emailAddress,
              // Decoración y estilo visual del campo de texto.
              decoration: const InputDecoration(
                // Texto de ayuda (hint) dentro del campo de entrada.
                hintText: 'estudiante@uae.edu.ec',
                // Icono decorativo de correo al inicio del campo.
                prefixIcon: Icon(Icons.email),
                // Borde definido rectangular para el campo de entrada.
                border: OutlineInputBorder(),
                // Etiqueta flotante para identificar el campo.
                labelText: 'Correo Electrónico',
              ),
            ),
            // Separador vertical SizedBox entre el TextField y el botón Enviar.
            const SizedBox(height: 20),
            // Botón interactivo ElevatedButton para enviar el correo ingresado.
            ElevatedButton(
              // Asigna la función _procesarFormulario al pulsar el botón.
              onPressed: _procesarFormulario,
              // Estilo personalizado del botón Enviar (color, dimensiones y bordes).
              style: ElevatedButton.styleFrom(
                // Fondo azul para el botón Enviar.
                backgroundColor: Colors.blue,
                // Color blanco para el texto del botón.
                foregroundColor: Colors.white,
                // Espaciado interno vertical para aumentar el área táctil.
                padding: const EdgeInsets.symmetric(vertical: 14),
                // Esquinas ligeramente redondeadas para el botón.
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              // Texto interno contenido dentro del botón.
              child: const Text(
                // Etiqueta textual del botón Enviar.
                'Enviar',
                // Estilo del texto del botón con tamaño 16 y peso en negrita.
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            // Separador vertical SizedBox entre el botón y el resultado.
            const SizedBox(height: 24),
            // Condicional para mostrar la tarjeta de resultado solo si _resultado no está vacío.
            if (_resultado.isNotEmpty)
              // Contenedor decorado para mostrar el resultado de forma clara.
              Container(
                // Relleno interno para la tarjeta de resultado.
                padding: const EdgeInsets.all(16),
                // Decoración visual con fondo tenue y borde coloreado.
                decoration: BoxDecoration(
                  // Fondo gris muy claro para destacar la información.
                  color: Colors.grey.shade100,
                  // Borde azul tenue alrededor del contenedor de resultado.
                  border: Border.all(color: Colors.blue.shade300),
                  // Esquinas redondeadas del contenedor.
                  borderRadius: BorderRadius.circular(8),
                ),
                // Widget Text que renderiza la variable de estado _resultado.
                child: Text(
                  // Muestra el valor actualizado de la variable de estado _resultado.
                  _resultado,
                  // Estilo del texto del resultado (rojo si es advertencia, azul si es éxito).
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: _resultado.startsWith('Por favor')
                        ? Colors.red.shade700
                        : Colors.blue.shade900,
                  ),
                  // Centra la alineación del texto del resultado.
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
