# creat-html-cssbash
# Generador de Página Web con Bash y HTML/CSS

Este script de Bash permite configurar y generar una página web básica con HTML y CSS de manera interactiva. A continuación, se proporciona una descripción general del código.

## Estructura del Proyecto

- `ejechtml.sh`: El script principal que facilita la configuración y generación de archivos HTML y CSS.
- `style.css`: Archivo CSS generado con los estilos aplicados.
- `index.html`: Archivo HTML generado con la configuración especificada.

## Configuración y Personalización

### Variables de Configuración

- `html_file`: Nombre del archivo HTML generado (`index.html`).
- `css_file`: Nombre del archivo CSS generado (`style.css`).
- `title`: Título predeterminado de la página web.
- `background_color`: Color de fondo predeterminado para el cuerpo de la página.
- `link_color`: Color predeterminado para los enlaces.
- `font_size`: Tamaño de fuente predeterminado.

### Propiedades de la Cuadrícula

- `grid_template_columns`: Columnas de la cuadrícula (predeterminado: `repeat(3, 1fr)`).
- `grid_gap`: Espaciado entre las celdas de la cuadrícula (predeterminado: `10px`).

### Elementos HTML

- `html_elements`: Array que contiene elementos HTML predeterminados (encabezados, párrafos, listas, etc.).

## Funciones Principales

### `generate_html()`

Genera el contenido del archivo HTML utilizando las variables de configuración y elementos HTML.

### `generate_css()`

Genera el contenido del archivo CSS con estilos y reglas de medios.

### `open_html()`

Abre el archivo `index.html` en el navegador predeterminado del sistema.

### `create_default_files()`

Crea archivos HTML y CSS por defecto utilizando las funciones `generate_html` y `generate_css`.

### Menú Interactivo

Un bucle interactivo que presenta un menú para personalizar la página web. Las opciones incluyen la creación de archivos por defecto, modificación del título, estilos generales, propiedades de la cuadrícula, y manipulación de elementos HTML.

## Uso

1. Ejecuta el script en tu terminal: `./ejechtml.sh`.
2. Sigue las opciones del menú para configurar tu página web.
3. Abre `index.html` en tu navegador para visualizar los cambios.

## Contribuciones

Las contribuciones son bienvenidas. Si deseas contribuir, [crea un problema](https://github.com/NEBULA1978/crear-css-html-responsive-grid-ejechtml.sh/issues) primero para discutir los cambios propuestos.

## Licencia

Este proyecto está bajo la Licencia [MIT](LICENSE).

¡Disfruta creando tu propia página web con Bash!
