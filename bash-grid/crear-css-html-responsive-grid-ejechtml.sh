#!/bin/bash

# Nombre del archivo HTML
html_file="index.html"

# Nombre del archivo CSS
css_file="style.css"

# Variables para opciones
title="Mi Página Web"
background_color="#f0f0f0"
link_color="#007BFF"
font_size="18px"

# Propiedades de la cuadrícula por defecto
grid_template_columns="repeat(3, 1fr)"
grid_gap="10px"

# Arrays para elementos HTML
html_elements=(
    "<h1>Encabezado 1</h1>"
    "<p>Párrafo de ejemplo.</p>"
    "<ul>"
    "    <li>Elemento 1</li>"
    "    <li>Elemento 2</li>"
    "    <li>Elemento 3</li>"
    "</ul>"
)

# Función para generar el HTML
generate_html() {
    echo "<!DOCTYPE html>"
    echo "<html lang=\"en\">"
    echo "<head>"
    echo "    <meta charset=\"UTF-8\">"
    echo "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">"
    echo "    <link rel=\"stylesheet\" href=\"$css_file\">"
    echo "    <title>$title</title>"
    echo "</head>"
    echo "<body style=\"background-color: $background_color;\" class=\"grid-container\">"
    echo "    <h1>$title</h1>"

    for element in "${html_elements[@]}"; do
        echo "    $element"
    done

    echo "</body>"
    echo "</html>"
}

# Función para generar el CSS
generate_css() {
    cat <<EOF >$css_file
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    display: grid;
    grid-template-columns: $grid_template_columns;
    gap: $grid_gap;
}

h1 {
    text-align: center;
    color: #333;
}

ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
}

li {
    margin: 10px;
}

a {
    text-decoration: none;
    color: $link_color;
    font-weight: bold;
    font-size: $font_size;
}

/* Reglas de medios para adaptar el diseño en diferentes tamaños de pantalla */
@media only screen and (max-width: 600px) {
    body {
        grid-template-columns: 1fr;
    }
}

@media only screen and (min-width: 601px) and (max-width: 1024px) {
    body {
        font-size: 16px;
    }
}
EOF
}

# Función para abrir el archivo index.html en el navegador predeterminado
# Función para abrir el archivo index.html en el navegador predeterminado
open_html() {
    if command -v open &> /dev/null; then
        open "$html_file"
    elif command -v start &> /dev/null; then
        start "$html_file"
    else
        echo "No se pudo determinar el comando para abrir el navegador."
    fi
}


# Función para crear por defecto el CSS y HTML
create_default_files() {
    generate_html > "$html_file"
    generate_css > "$css_file"
    echo "Archivos por defecto creados: $html_file, $css_file"
}

# Menú interactivo
while true; do
    clear
    echo "Menú de Configuración"
    echo "0. Crear por defecto HTML y CSS"
    echo "1. Modificar Título"
    echo "2. Modificar Estilos Generales"
    echo "3. Modificar Propiedades de la Cuadrícula"
    echo "4. Añadir Elemento HTML"
    echo "5. Eliminar Elemento HTML"
    echo "6. Ver HTML y CSS en Consola"
    echo "7. Abrir index.html en el Navegador"
    echo "8. Salir"

    read -p "Seleccione una opción: " choice

    case $choice in
        0)
            create_default_files
            ;;
        1)
            read -p "Nuevo Título: " title
            ;;
        2)
            read -p "Nuevo Color de Fondo (ej. #ffffff): " background_color
            read -p "Nuevo Color de Enlace (ej. #0000ff): " link_color
            read -p "Nuevo Tamaño de Fuente (ej. 16px): " font_size
            ;;
        3)
            echo "Propiedades de la Cuadrícula Actuales:"
            echo "1. Columnas: $grid_template_columns"
            echo "2. Espaciado: $grid_gap"
            read -p "Seleccione el número de la propiedad a modificar: " grid_choice

            case $grid_choice in
                1)
                    read -p "Nuevas Columnas (ej. repeat(3, 1fr)): " grid_template_columns
                    ;;
                2)
                    read -p "Nuevo Espaciado (ej. 10px): " grid_gap
                    ;;
                *)
                    echo "Opción no válida. Inténtalo de nuevo."
                    ;;
            esac
            ;;
        4)
            read -p "Ingrese el nuevo elemento HTML: " new_element
            html_elements+=("$new_element")
            ;;
        5)
            echo "Elementos HTML Actuales:"
            for index in "${!html_elements[@]}"; do
                echo "$index: ${html_elements[$index]}"
            done
            read -p "Seleccione el número del elemento a eliminar: " index_to_remove
            if [[ $index_to_remove -ge 0 && $index_to_remove -lt ${#html_elements[@]} ]]; then
                unset 'html_elements[index_to_remove]'
                html_elements=("${html_elements[@]}")
            else
                echo "Índice no válido."
            fi
            ;;
        6)
            clear
            echo "Contenido del HTML:"
            generate_html
            echo -e "\nContenido del CSS:"
            generate_css
            read -p "Presiona Enter para continuar..."
            ;;
        7)
            open_html
            ;;
        8)
            exit 0
            ;;
        *)
            echo "Opción no válida. Inténtalo de nuevo."
            ;;
    esac
done
