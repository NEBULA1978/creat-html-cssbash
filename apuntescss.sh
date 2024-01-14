#!/bin/bash

while true; do
    # Imprimir el menú
    echo "Menú Principal"
    echo "1. Resumen"
    echo "2. Sintaxis"
    echo "3. Ejemplo"
    echo "4. Especificaciones"
    echo "5. Compatibilidad con navegadores"
    echo "6. Ver también"
    echo "0. Salir"

    # Leer la opción del usuario
    read -p "Ingrese el número de la sección que desea ver (0 para salir): " opcion

    # Evaluar la opción ingresada
    case $opcion in
        1)
            echo "Ha seleccionado Resumen. Aquí está la información:"
            cat -n apuntescss.txt | sed -n '/Resumen/,/Sintaxis/p'
            ;;
        2)
            echo "Ha seleccionado Sintaxis. Aquí está la información:"
            cat -n apuntescss.txt | sed -n '/Sintaxis/,/Ejemplo/p'
            ;;
        3)
            echo "Ha seleccionado Ejemplo. Aquí está la información:"
            cat -n apuntescss.txt | sed -n '/Ejemplo/,/Especificaciones/p'
            ;;
        4)
            echo "Ha seleccionado Especificaciones. Aquí está la información:"
            cat -n apuntescss.txt | sed -n '/Especificaciones/,/Compatibilidad con navegadores/p'
            ;;
        5)
            echo "Ha seleccionado Compatibilidad con navegadores. Aquí está la información:"
            cat -n apuntescss.txt | sed -n '/Compatibilidad con navegadores/,/Ver también/p'
            ;;
        6)
            echo "Ha seleccionado Ver también. Aquí está la información:"
            cat -n apuntescss.txt | sed -n '/Ver también/,/^$/p'
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
