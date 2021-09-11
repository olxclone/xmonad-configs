echo "########################################################"
echo "###### installing the xmonad configured desktop ########"
echo "########################################################"

echo "##### UPDATING THE SYSTEM #####"
sudo pacman -Syu 

echo "######## UPDATED THE SYSTEM ##########"


echo "######## INSTALLING THE AUR HELPER ##########"
echo "######## INSTALLING THE NEEDED PACKAGES #########"
sudo pacman -S --needed base-devel
sudo git clone https://aur.archlinux.org/yay.git
sudo chown -R $USER:$USER ./yay
cd yay 
makepkg -si
cd ..

echo "####### INSTALLED THE AUR HELPER YAY"
echo "####### LET'S INSTALL SOME FONTS REQUIRED ########"
mkdir -p ~/.local/share/fonts
cp -r ./fonts ~/.local/share/fonts

echo "####### INSTALLING A DISPLAY MANAGER ########"
sudo pacman -S --needed --noconfirm lightdm lightdm-gtk-greeter

sudo systemctl enable lightdm.service

echo "####### INSTALLING THE PACKAGES REQUIRED FOR XMONAD"
echo "####### THIS MAY TAKE SOME TIME . BE PATIENT"
yay -S xmonad xmonad-contrib polybar picom-jonaburg-git nvim polykit alacritty xorg dunst rofi betterlockscreen xautolock nitrogen 

echo "####### REBOOTING THE SYSTEM ########"

reboot
