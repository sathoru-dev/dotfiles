#!/bin/bash

# Asegurarse de que zenity está instalado
if ! command -v zenity &> /dev/null
then
    echo "zenity no está instalado. Instálalo usando 'sudo pacman -S zenity'."
    exit 1
fi

# Seleccionar la imagen mediante una ventana gráfica
IMAGE_SOURCE=$(zenity --file-selection --title="Selecciona una imagen" --file-filter="Imágenes | *.png *.jpg *.jpeg")

# Verificar si se seleccionó una imagen
if [ -z "$IMAGE_SOURCE" ]; then
    notify-send "¿Que paso $USER?" "Cancelaste la ejecucion, ten cuidado con tus acciones"

    echo "No se seleccionó ninguna imagen."
    exit 1
fi




# Reiniciar hyprpaper
pkill hyprpaper
pkill waybar
pkill swaync

# Ruta del directorio de destino donde se copiará la imagen
DEST_DIR="/home/sathoru/.config/wallpaper"

# Nombre de la imagen en el directorio de destino (ajústalo según tu configuración de hyprpaper)
IMAGE_DEST_NAME="background.jpg"

# Ruta completa del archivo de destino
IMAGE_DEST="$DEST_DIR/$IMAGE_DEST_NAME"

# Copiar o reemplazar la imagen en el directorio de destino y renombrarla
cp "$IMAGE_SOURCE" "$IMAGE_DEST"

# AAAA
(wal -i $IMAGE_SOURCE) &
sleep 2

hyprpaper &
waybar &
swaync &
notify-send "Hola $USER" "En teoria basica, los colores debieron cambiar, de no ser asi selecciona otra vez el fondo"