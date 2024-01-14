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
    cat <<EOF >$html_file
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="$css_file">
    <title>$title</title>
</head>
<body style="background-color: $background_color;">
    <h1>$title</h1>

EOF

    for element in "${html_elements[@]}"; do
        echo "    $element" >> $html_file
    done

    cat <<EOF >>$html_file
</body>
</html>
EOF
}

# Función para generar el CSS
generate_css() {
    cat <<EOF >$css_file
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
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

# Menú interactivo para modificar opciones y elementos HTML
while true; do
    clear
    echo "Menú de Configuración"
    echo "1. Modificar Título"
    echo "2. Modificar Estilos"
    echo "3. Añadir Elemento HTML"
    echo "4. Eliminar Elemento HTML"
    echo "5. Salir"

    read -p "Seleccione una opción: " choice

    case $choice in
        1)
            read -p "Nuevo Título: " title
            ;;
        2)
            read -p "Nuevo Color de Fondo (ej. #ffffff): " background_color
            read -p "Nuevo Color de Enlace (ej. #0000ff): " link_color
            read -p "Nuevo Tamaño de Fuente (ej. 16px): " font_size
            ;;
        3)
            read -p "Ingrese el nuevo elemento HTML: " new_element
            html_elements+=("$new_element")
            ;;
        4)
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
        5)
            generate_html
            generate_css
            exit 0
            ;;
        *)
            echo "Opción no válida. Inténtalo de nuevo."
            ;;
    esac
done
