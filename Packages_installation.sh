#!/bin/env bash

## COLORS ##
CDEF=" \033[0m"                                     # default color
CCIN=" \033[0;36m"                                  # info color
CGSC=" \033[0;32m"                                  # success color
CRER=" \033[0;31m"                                  # error color
CWAR=" \033[0;33m"                                  # waring color
b_CDEF=" \033[1;37m"                                # bold default color
b_CCIN=" \033[1;36m"                                # bold info color
b_CGSC=" \033[1;32m"                                # bold success color
b_CRER=" \033[1;31m"                                # bold error color
b_CWAR=" \033[1;33m"                                # bold warning color

### VARIABLES
FULL_INSTALLATON=true

### ARRAYS
declare -a OFFICIAL_packages_essencial=(
    "xorg"
    "xorg-xinit"
    "xorg-xprop"
    "xorg-xev"
    "xdotool"
    "network-manager-applet"
    "nitrogen"
    "picom"
    "neovim"
    "alacritty"
    "i3-gaps"
    "dmenu"
    "qutebrowser"
    "ttf-hack"
    "ttf-opensans"
    "ttf-ubuntu-font-family"
    "powerline-fonts"
    "pass"
    "ffmpeg"
    "vifm"
    "python-pip"
    "rofi"
    "flameshot"
    "papirus-icon-theme"
    "noto-fonts-emoji"
    "audacious"
    "starship"
    "dunst"
    "npm"
    "pulseaudio"
    "youtube-dl"
    "mpv"
    "mpd"
    "hwinfo"
    "acpi"
    "mlocate"
    "fish"
    "sxiv"
    "xwallpaper"
    "lxappearance"
    "qt5ct"
)

declare -a OFFICIAL_packages_not_essential=(
    "base-devel"
    "libreoffice-fresh"
    "telegram-desktop"
    "discord"
    "grub-customizer"
    "code"
    "vlc"
    "nautilus"
)

declare -a DMENU_scripts_dependencies=(
    "jq"
    "xclip"
    "libnotify"
    "pandoc"
    "sqlite"
    "gtk2"
    "xsel"
)

declare -a TOTORO_scripts_dependencies=(
    "pavucontrol-qt"
    "imagemagick"
    "scrot"
    "wmctrl"
    "slop"
    "cmus"
)

declare -a AUR_packages_essential=(
    "brave-bin"
    "nerd-fonts-mononoki"
    "nerd-fonts-ubuntu-mono"
    "nerd-fonts-jetbrains-mono"
    "nerd-fonts-victor-mono"
    "ttf-iosevka"
    "polybar"
    "i3lock-color"
    "sublime-text-4"
    "nordic-theme"
    "wget"
)

declare -a AUR_packages_not_essential=(
    "notion-app"
    "xava-git"
)

declare -a NPM_packages=(
    "alacritty-themes"
    "instant-markdown-d"
)


### FUNCTIONS
prompt () {
  case ${1} in
    "-s"|"--success")
      echo -e "${b_CGSC}${@/-s/}${CDEF}";;          # print success message
    "-e"|"--error")
      echo -e "${b_CRER}${@/-e/}${CDEF}";;          # print error message
    "-w"|"--warning")
      echo -e "${b_CWAR}${@/-w/}${CDEF}";;          # print warning message
    "-i"|"--info")
      echo -e "${b_CCIN}${@/-i/}${CDEF}";;          # print info message
    *)
    echo -e "$@"
    ;;
  esac
}

askForScriptProcedure () {
    prompt -e "\n\t******************************************************************\n\t* If errors occured in this step I sugest you to stop the script *\n\t******************************************************************"

    read -r -p "Do you want to proceed with the script? [Y/n] " response
    case $response in
        [nN])
            exit 0
            ;;
        *)
            ;;
    esac
}

errorNoteTaking () {
     prompt -w "\n\t******************************************************************\n\t* If errors occured in this step I sugest you to take a note now *\n\t******************************************************************"

    read -r -p "Do you want to proceed with the script? [Y/n] " response
    case $response in
        [nN])
            exit 0
            ;;
        *)
            ;;
    esac
   
}


## CLEANING THINGS POSSIBLY ALREADY THERE
prompt -i "\n\t************************************\n\t* Removing possibly existing files *\n\t************************************"

if [ -f ~/.bashrc ]; then
   rm ~/.bashrc 
fi

if [ -f ~/.bash_profile ]; then
   rm ~/.bash_profile 
fi

if [ -f ~/.xinitrc ]; then
   rm ~/.xinitrc 
fi

if [ -f /etc/xdg/reflector/reflector.conf ]; then
    sudo mv /etc/xdg/reflector/reflector.conf /etc/xdg/reflector/reflector.conf.BACKUP
fi


prompt -i "\n\t***************************************\n\t* Placing config files in your places *\n\t***************************************"
(cd ~/.dotfiles/From\ root && sudo stow --target="/" *)
(cd ~/.dotfiles/From\ home && stow --target="$HOME/" *)

askForScriptProcedure


# SIGNING PACKAGES

sudo pacman -Sy archlinux-keyring
sudo pacman-key --init
sudo pacman-key --populate archlinux


# UPDATING MIRRORS
prompt -i "\n\t********************\n\t* Updating mirrors *\n\t********************"
if [ -f /etc/pacman.d/mirrorlist ]; then
   sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.BACKUP 
fi

sudo pacman -S reflector
reflector --latest 200 --country Brazil, --protocol http,https --sort rate --save /etc/pacman.d/mirrorlist
systemctl enable reflector.timer
systemctl start reflector.timer

sudo pacman -Syu
sudo pacman -Syu pacman-mirrorlist

askForScriptProcedure


## GENERAL PACKAGES FROM OFFICIAL REPOSITORIES
prompt -i "\n\t**************************************************\n\t* Installing packages from official repositories *\n\t**************************************************"
prompt -w "\n\t1) FULL installation\n\t2) MINIMAL installation"
read -r -p "Please select an option: [default=1] " response
case $response in
    2)
        FULL_INSTALLATION=false
        echo "Minimal installation chosen..."
        sudo pacman -S ${OFFICIAL_packages_essential[@]}
        ;;
    *)
        FULL_INSTALLATION=true
        echo "Full installation chosen..."
        sudo pacman -S ${OFFICIAL_packages_essential[@]}
        sudo pacman -S ${OFFICIAL_packages_not_essential[@]}
        ;;
esac

askForScriptProcedure


## COMPLETING NPM INSTALLATION WITH NODE.JS (necessary for alacritty-themes)
prompt -i "\n\t*******************************\n\t* Completing NPM installation *\n\t*******************************"
sudo npm cache clean -f
sudo npm install -g n
sudo n stable
sudo npm install -g npm@latest
sudo npm install -g npm

askForScriptProcedure


## DMENU SCRIPTS DEPENDENCIES
prompt -i "\n\t*******************************\n\t* Dmenu scripts dependencies* *\n\t*******************************"
sudo pacman -S ${DMENU_scripts_dependencies[@]}



## TOTORO SCRIPTS DEPENDENCIES
prompt -i "\n\t*******************************\n\t* Totoro scripts dependencies *\n\t*******************************"
sudo pacman -S ${TOTORO_scripts_dependencies[@]}

errorNoteTaking


## INSTALLING YAY AND AUR PACKAGES
prompt -i "\n\t******************\n\t* Installing Yay *\n\t******************"
git clone https://aur.archlinux.org/yay-git.git ~/.yay-git/
(cd ~/.yay-git && makepkg -si)

yay --save --answerclean All --answerdiff None

askForScriptProcedure

prompt -i "\n\t********************************\n\t* Installing unofficial packages *\n\t********************************"
if $FULL_INSTALLATION ; then
    yay -S ${AUR_packages_essential[@]}
    yay -S ${AUR_packages_not_essential[@]}
else
    yay -S ${AUR_packages_essential[@]}
fi
# if xava doesn't work, run yay -S 'xava-git' again

sudo npm install -g ${NPM_packages[@]}
askForScriptProcedure


# DRIVERS INSTALLATION
prompt -s "\n\t************************\n\t* Drivers installation *\n\t************************"
prompt -w "\n\t1) Nvidia drivers\n\t2) Virtual Box\n\t3) None"
read -r -p "Please select an option: [default=1] " response
case $response in
    2)
        echo "Installing VBox utils..."
        sudo pacman -S xf86-video-fbdev virtualbox-guest-utils xf86-video-vmware
        ;;
    3)
        echo "No drivers installed"
        ;;
    *)
        echo "Installing nvidia..."
        sudo pacman -S --noconfirm nvidia nvidia-utils
        nvidia-xconfig
        ;;
esac

errorNoteTaking


## DMENU
prompt -i "\n\t********************\n\t* Installing Dmenu *\n\t********************"
sudo pacman -R dmenu
(cd ~/.repos/dmenu_program && sudo make clean install)
cp -rf ~/.repos/dmenu/config.h ~/.repos/dmenu_program/
(cd ~/.repos/dmenu_program && sudo make clean install)

errorNoteTaking


## CREATING DIRECTORIES
prompt -i "\n\t************************\n\t* Creating Directories *\n\t************************"
mkdir ~/Desktop/ ~/Downloads/ ~/Pictures/ ~/Pictures/Screenshots/ ~/Music/ ~/Music/Ambient\ Sounds/


## SETTING UP SDDM DISPLAY MANAGER (the logging screen)
prompt -i "\n\t*************************************\n\t* Setting up SDDM (display manager) *\n\t*************************************"
sudo pacman -S sddm
yay --noconfirm -S sddm-sugar-candy-git
sudo systemctl enable sddm -f
sudo systemctl enable sddm.service -f

askForScriptProcedure


## SETTING UP GRUB THEME
prompt -i "\n\t*************************\n\t* Setting up Grub theme *\n\t*************************"
(cd ~/.dotfiles/From\ root/Grub\ Themes/usr/share/grub/themes/ && sudo ./install.sh)

errorNoteTaking


## Post packages stow
prompt -i "\n\t****************************************************\n\t* Placing post inicial packages installation files *\n\t****************************************************"

(cd ~/.dotfiles/PostFiles && sudo stow --target="/" *)

sudo fc-cache -fv # for refreshing the font cache 


# CLEANING... -> problems happened with sddm and I think this was the guilty
# sudo pacman --noconfirm -Sc
# yay --noconfirm -Yc


## DECRYPTING (minor) PRIVATE THINGS
prompt -w "\n\t***************************************\n\t* DECRIPTION OF (MINOR) PRIVATE FILES *\n\t***************************************"
read -r -p "Are you Samuel Fernandes? [y/n] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    (cd ~/.dotfiles/From\ home/qutebrowser/.config/qutebrowser/ && gpg -d encrypted.gpg | tar x)
fi

errorNoteTaking


## REBOOT
prompt -s "\n\t***********************************************\n\t* Everything is set up and ready for a reboot *\n\t***********************************************"
read -r -p "Are you ready to reboot now? [y/n] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    sudo reboot now
fi

