## 🚀 Sathoru - Dotfiles

En este repositorio se comparten al publico en general todos los scripts y archivos de configuracion de mi actual sistema operativo, tener en cuenta que apenas se esta iniciando en estos y puede que su instalacion sea un poco confusa en general.


## 🖼️ Resultados

🌟 **Escritorio**
![Escritorio](https://raw.githubusercontent.com/sathoru-dev/dotfiles/refs/heads/main/assets/desktop.png?raw=true)

🌠 **Explorador de archivos (Nemo)**
![Explorador](https://github.com/sathoru-dev/dotfiles/blob/main/assets/files.png?raw=true)

⭐ **Navegador (Firefox)**
![Navegador](https://github.com/sathoru-dev/dotfiles/blob/main/assets/firefox.png?raw=true)

🐱‍💻 **Terminal (Kitty)**
![Terminal](https://github.com/sathoru-dev/dotfiles/blob/main/assets/kitty.png?raw=true)

💫 **Lanzador de aplicaciones (Rofi)**
![Lanzador](https://github.com/sathoru-dev/dotfiles/blob/main/assets/rofi.png?raw=true)

✨ **Centro de Notificaciones (Swaync)**
![Centro de control](https://github.com/sathoru-dev/dotfiles/blob/main/assets/swaync.png?raw=true)

🌃 **Barra de tareas (Waybar)**
![Barra de tareas](https://github.com/sathoru-dev/dotfiles/blob/main/assets/waybar.png?raw=true)

## 🛠️ Instalacion

⚠️ **Importante:**

Instalar todos los paquetes antes de realizar cualquier copia de configuraciones

⚙️ **Configuracion de terminal de comandos**

Instalar los siguientes paquetes:
- **git** (Sistema de control de versiones)
- **yay** (helper de AUR) ℹ️ *Algunos paquetes solo estan disponibles en AUR* 
- **ZSH** (Instalar)
```bash
# Instalacion
sudo pacman -S zsh
# Cambiar el interprete por defecto a "zsh"
chsh -s /bin/zsh
```

**🔃 Reinicia el equipo**

-  **Oh My ZSH** (Instalar)

    - **Plugins de zsh**
        - zsh-autosuggestions
        - zsh-syntax-highlighting
        - zsh-history-substring-search

    Despues de instalados agregalos en el archivo de configuracion ".zshrc" que esta en el directorio "home"

- **Power level 10k**

    Para darle mas vida y estilo a la terminal puedes descargar este pequeño paquete

- **Alias de comandos**

    Para optimizar tiempo, puedes agregar los siguietes alias en el archivo de configuracion *.zshrc*
    ```sh
    alias install="sudo pacman -S"
    alias aur_install="yay -S"
    alias update="sudo pacman -Syu"
    alias purge="sudo pacman -Rns"
    ```

🧰 **Paquetes a instalar**

- **Navegador**
    ```bash
    install firefox
    ```

- **Mostrar imagenes en la terminal**
    ```bash
    install chafa
    ```

- **Utilidad de tema, fuente e iconos de GTK**
    ```bash
    install gnome-tweaks
    ```

- **Fondo de pantalla**
    ```bash
    install swww
    ```

- **Bloqueo de pantalla**
    ```bash
    install hyprlock
    ```

- **Opciones de apagado**
    ```bash
    aur_install wlogout
    ```

- **Informacion de sistema en terminal**
    ```bash
    install neofetch
    ```

- **Paleta de colores basada en el fonde de pantalla**
    ```bash
    aur_install python-pywal16
    ```

- **Lanzador de aplicaciones**
    ```bash
    install rofi-wayland
    ```

- **Explorador de archivos**
    ```bash
    install nemo
    ```

- **Traduccion a español del gestor de archivos**
    ```bash
    install cinnamon-translations
    ```

- **Barra de tareas**
    ```bash
    install waybar
    ```

    - **Fuente de iconos**
        ```bash
        install ttf-jetbrains-mono-nerd
        ```

- **Centro de notificaciones**

    **Nota:** Eliminar cualquier demonio de notificaciones existente

    ```bash
    install swaync
    ```

- **Cuadros de dialogos**
    ```bash
    install zenity
    ```

- **Realizar captura de pantallas**
    ```bash
    aur_install hyprshot
    ```

- **Visualizador de audio**
    ```bash
    aur_install cava
    ```

- **Paquete para numeros de presicion**
    ```bash
    install bc
    ```

- **Visualizador de imagenes**
    ```bash
    install eog
    ```

- **Monitor de sistema**
    ```bash
    install gnome-system-monitor
    ```

- **Visualizador de PDF**
    ```bash
    install evince
    ```

- **Editor de codigo**
    ```bash
    aur_install visual-studio-code-bin
    ```

- **Colores de ram y dispositivos compatibles con rgb**
    ```bash
    install openrgb
    ```

- **Musica**
    ```bash
    aur_install spotify #Instalas e inicias sesion
    aur_install spotify-adblock #Eliminar publicidad
    ```
## 🎨 Temas y personalizacion

- 🏙️ **Iconos:** *Magna-Dark-Icons*
- 🖍️ **Tema:** *Lavanda-gtk-theme*
- 🗚 **Fuente:** *Century Gothic*
- 🖱️ **Mouse:** *Anya-cursor-v3*

⚠️ **Para que los temas se muestren correctamente debes instalar lo siguiente**
```bash
install xdg-desktop-portal-hyprland
install xdg-desktop-portal-gtk
```

📄 **Fuentes adicionales**

- **Fuentes Japonesas**
    ```bash
    install noto-fonts-cjk
    install noto-fonts-emoji
    install noto-fonts
    ```

## ✅ Pasos finales

Ahora si copia los archivos que se encuentran en la carpeta ".config" a la carpeta de configuracion de tu sistema, con mucha calma y paciencia tienes que ir revisando las rutas de algunos archivos y cambiarlas con el nombre de tu usuario