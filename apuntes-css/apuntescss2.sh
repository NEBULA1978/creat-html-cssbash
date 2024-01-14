#!/bin/bash

# Función para mostrar el menú
mostrar_menu() {
    echo "Menú Principal"
    echo "1. Resumen"
    echo "2. Fuentes y texto"
    echo "3. Cajas, cajas, todo se trata de cajas"
    echo "4. Conclusión"
    echo "0. Salir"
}

while true; do
    mostrar_menu

    # Leer la opción del usuario
    read -p "Ingrese el número de la sección que desea ver (0 para salir): " opcion

    case $opcion in
        1)
            echo "Ha seleccionado Resumen. Aquí está la información:"
            # Imprimir contenido correspondiente a la sección de Resumen
            awk '/Resumen/,/Fuentes y texto/' apuntescss2.txt
            ;;
        2)
            echo "Ha seleccionado Fuentes y texto. Aquí está la información:"
            # Imprimir contenido correspondiente a la sección de Fuentes y texto
            awk '/Fuentes y texto/,/Cajas, cajas, todo se trata de cajas/' apuntescss2.txt
            ;;
        3)
            echo "Ha seleccionado Cajas, cajas, todo se trata de cajas. Aquí está la información:"
            # Imprimir contenido correspondiente a la sección de Cajas
            awk '/Cajas, cajas, todo se trata de cajas/,/Conclusión/' apuntescss2.txt
            ;;
        4)
            echo "Ha seleccionado Conclusión. Aquí está la información:"
            # Imprimir contenido correspondiente a la sección de Conclusión
            awk '/Conclusión/{flag=1; next} /Found a content problem/{flag=0} flag' apuntescss2.txt
            ;;
        0)
            echo "Saliendo del programa. ¡Hasta luego!"
            exit 0
            ;;
        *)
            echo "Opción no válida. Por favor, ingrese un número válido."
            ;;
    esac
done
