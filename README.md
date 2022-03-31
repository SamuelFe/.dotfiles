# Restoring

## Credits
The ricing part of this configs came from this guy [here](https://www.reddit.com/r/unixporn/comments/p42g3l/i3_simple_man_rice_one_dark_nord_dracula_mixture/).
This is the guy's GitHub [repository](https://github.com/totoro-ghost/dotfiles).

## Disk Usage
After everything was installed in a VM with /home in a separate partition, the occupied space was:
```
 12GB in /
1.2GB in /home
```
I recommend at least a 30GB disk to proceed with the script.

### Assumptions
The Packages_installation.sh script assumes that you're in a fresh Arch Linux installation, following the ArchWiki guide. The following packages are not installed with the scrpit and may be installed before running it:
```
nano sudo grub efibootmgr dosfstools os-prober mtools networkmanager wireless_tools wpa_supplicant dialog git xorg-setxkbmap sto stow 
```

### Caution
Any `.bashrc`, `.bash_profile` and `.xinitrc` will be deleted.

### How to use
```
# Inside home/your_user/ directory:
git clone https://github.com/SamuelFe/.dotfiles.git
cd .dotfiles/
chmod +x Packages_installaton.sh && ./Packages_installation.sh
```

