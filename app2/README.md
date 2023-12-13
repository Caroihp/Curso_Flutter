# app2

Esta aplicación Flutter es una interfaz de usuario para el inicio de sesión. Utiliza un diseño moderno con un formulario de autenticación, que incluye validación de correo electrónico y contraseña. La aplicación permite a los usuarios ingresar su correo electrónico y contraseña para acceder a una pantalla de inicio.

## Funcionalidad

-Interfaz para que los usuarios inicien sesión con su correo electrónico y contraseña.
-Uso de TextFormField para la entrada de correo electrónico y contraseña, con validaciones específicas para cada uno.
-Validación de correo electrónico mediante EmailValidator.
-Verificación de la longitud de la contraseña (entre 8 y 20 caracteres).
-Checkbox para permitir a los usuarios elegir si desean que la aplicación recuerde sus credenciales.
-Un botón de 'Iniciar Sesión' que valida las credenciales y redirige a la pantalla de inicio si son correctas.
-Un botón '¿Olvidaste tu contraseña?' para futuras implementaciones de recuperación de contraseña.
-Una pantalla simple que se muestra después de un inicio de sesión exitoso, indicando que el usuario ha ingresado a la aplicación.
-Un diseño moderno con un gradiente de azules, íconos blancos y textos, y bordes estilizados para los campos de texto.
-Uso de GlobalKey para manejar el estado del formulario de inicio de sesión.
-TextEditingController para gestionar el texto de los campos de correo electrónico y contraseña.

## Cómo Ejecutar

Para ejecutar esta aplicación en tu dispositivo local, dirigete a la carpeta lib y en la terminal 
ejecuta el comando flutter run

### Requisitos Previos

Asegúrate de tener Flutter instalado en tu sistema. Si no lo tienes instalado, puedes seguir las [instrucciones de instalación de Flutter](https://flutter.dev/docs/get-started/install).

### Pasos para Ejecutar

1. Clona este repositorio o descarga el código fuente en tu máquina local.

git clone < https://github.com/Caroihp/Curso_Flutter.git >
git clone < https://github.com/ConiMJG/Proyectos-Flutter- >
