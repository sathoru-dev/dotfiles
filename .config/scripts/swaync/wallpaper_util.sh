#!/bin/bash

# Función para mostrar el cuadro de diálogo con la lista de opciones
show_dialog() {
     # Usamos Zenity para crear una lista con opciones en formato de selección única (radiolist)
    zenity --list \
        --radiolist \
        --height=400 \
        --width=700 \
        --title="¡Hola!, $USER" \
        --text="Selecciona una de las opciones disponibles:" \
        --column="" \
        --column="Nombre" \
        --column="Descripción" \
        FALSE "Fondo de bloqueo" "Cambia el fondo de pantalla de hyprlock" \
        FALSE "Fondo Inicio de Sesion" "Cambia el fondo de pantalla de inicio de sesion" \
        TRUE "Fondo de pantalla" "Cambia el fondo de pantalla junto a los colores" \
        FALSE "Solo fondo de pantalla" "Cambia solo el fondo de pantalla conservando los colores" \
        FALSE "Colores de interfaz" "Cambia el esquema de colores subiendo una imagen"
}


# Cuadro de despedida
good_bye() {
    zenity --info \
    --title="¡Hasta luego!" \
    --text="Gracias por usar este programa. ¡Que tengas un excelente día, $USER!" \
    --width=300 \
    --height=100
}

# Función para enviar notificaciones
launch_notify() {
    notify-send "Wallpaper Utility 󰋵" "$1"
}

# Función para seleccionar una imagen
select_image() {
    zenity --file-selection --title="Selecciona una imagen" --file-filter="Imágenes | *.png *.jpg *.jpeg"
}

wallpaper() {
    echo "-------------------------------------------------------"
    echo $1
    swww img --transition-type outer --transition-pos 0.854,0.977 --transition-step 90 "$1"
}

# Función para cambiar el color del fondo usando `wal`
change_color() {
    wal --cols16 -i "$1" &
    sleep 1
}

change_wallpaper_color() {
    local image

    image=$(select_image)
    wallpaper "$image"
    sleep 3

    pkill waybar
    pkill swaync

    change_color "$image"

    waybar &
    swaync &
    
    launch_notify "Se ha cambiado el fondo de pantalla y los colores"
}

change_colors() {
    local image
    image=$(select_image)
    pkill swww-daemon
    pkill waybar
    pkill swaync

    change_color "$image"
    waybar &
    swaync &
    swww-daemon &
    launch_notify "Se ha cambiado solo los colores"

}

change_wallpaper() {
    local image
    image=$(select_image)
    wallpaper "$image"
    launch_notify "Se ha cambiado solo el wallpaper"

}

change_locked() {

    if [ -d ~/.cache/hyprlock ]
    then
        local image
        local name_image
        image=$(select_image)
        name_image="${image##*/}"

        rm -r ~/.cache/hyprlock/* # Elimina los archivos dentro de la cache
        cp $image ~/.cache/hyprlock/
        echo "\$wallpaper = /home/sathoru/.cache/hyprlock/$name_image" > ~/.cache/hyprlock/wallpaper.conf

        launch_notify "El fondo de pantalla de bloqueo se ha cambiado exitosamente <span color='green'></span>"
    else
        zenity --error --title="Error de configuracion" --text="Los archivos nesesarios para la ejecucion de esta tarea no estan configurados correctamente"
    fi
}

wallpaper_sddm() {
    local image

    dir="/usr/local/etc/sddm"

    # Validar que todo este configurado exitosamente
    if [ -d "$dir" ]
    then
        image=$(select_image)
        name_image="${image##*/}"

        rm -r "$dir"/* # Elimina los archivos dentro de la cache
        cp $image "$dir"
        ln -sf "$dir/$name_image" "$dir/sddm_background" 

        launch_notify "Fondo de inicio de sesion cambiado exitosamente"
    else
        zenity --error --title="Error de configuracion" --text="Los archivos nesesarios para la ejecucion de esta tarea no estan configurados correctamente"
    fi
}

# Bucle principal para mantener la interacción hasta que el usuario decida salir
while true; do
    # Llama a la función show_dialog y almacena la opción seleccionada en la variable 'selected_item'
    selected_item=$(show_dialog)

    # Si el usuario cierra el cuadro de diálogo o presiona cancelar, salimos del script
    [ $? -ne 0 ] && { good_bye; exit 0; }

    # Maneja la opción seleccionada mediante un bloque case
    case "$selected_item" in
        "Fondo de bloqueo")
            change_locked
            ;;
        "Fondo Inicio de Sesion")
            wallpaper_sddm
            ;;
        "Fondo de pantalla") 
            change_wallpaper_color  # Llama a la función para cambiar fondo y colores (a implementar)
            ;;
        "Solo fondo de pantalla") 
            change_wallpaper  # Llama a la función para cambiar solo el fondo (a implementar)
            ;;
        "Colores de interfaz") 
            change_colors  # Llama a la función para cambiar solo los colores (a implementar)
            ;;
        *) 
            echo "Selección no válida."  # Maneja cualquier caso no esperado
            ;;
    esac

    # Pregunta al usuario si desea realizar otra acción
    if zenity --question --title="󰣇" --text="¿Quieres hacer algo mas?" --ok-label="Sí" --cancel-label="No"; then
        continue  # Si el usuario elige "Sí", reinicia el bucle
    else
        break  # Si el usuario elige "No", sale del bucle
    fi
done 