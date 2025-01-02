#!/bin/bash

# Verifica si se pasó un parámetro
if [ -z "$1" ]; then
  echo "Error: No se ha proporcionado el valor de opacidad."
  exit 1
fi

# Recibe el valor de la opacidad como el primer argumento
opacity_value=$1

# Ejecuta el comando hyprctl para cambiar la opacidad
hyprctl keyword windowrule "opacity $opacity_value, .*"

# Convierte la opacidad a porcentaje (multiplicando por 100)
opacity_percentage=$(echo "$opacity_value * 100" | bc)

# Opcional: Muestra un mensaje confirmando la acción
notify-send "Transparencia cambiada" "Se ha establecido la opacidad a un $opacity_percentage%"
