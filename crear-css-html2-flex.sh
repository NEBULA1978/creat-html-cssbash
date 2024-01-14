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

# Propiedades flex por defecto
flex_direction="row"
justify_content="center"
align_items="center"

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
    echo "<body style=\"background-color: $background_color;\" class=\"flex-container\">"
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
    display: flex;
    flex-direction: $flex_direction;
    justify-content: $justify_content;
    align-items: $align_items;
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
EOF
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
    echo "3. Modificar Propiedades Flex"
    echo "4. Añadir Elemento HTML"
    echo "5. Eliminar Elemento HTML"
    echo "6. Ver HTML y CSS en Consola"
    echo "7. Salir"

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
            echo "Propiedades Flex Actuales:"
            echo "1. Dirección: $flex_direction"
            echo "2. Justificar: $justify_content"
            echo "3. Alinear: $align_items"
            read -p "Seleccione el número de la propiedad a modificar: " flex_choice

            case $flex_choice in
                1)
                    read -p "Nueva Dirección (ej. row, column): " flex_direction
                    ;;
                2)
                    read -p "Nueva Justificación (ej. center, space-between): " justify_content
                    ;;
                3)
                    read -p "Nueva Alineación (ej. center, flex-start): " align_items
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
            exit 0
            ;;
        *)
            echo "Opción no válida. Inténtalo de nuevo."
            ;;
    esac
done
