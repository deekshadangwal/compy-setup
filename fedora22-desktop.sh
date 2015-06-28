echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "~~~~~~~~~~~~~~~~~~~~~ FEDORA 22  INSTALL ~~~~~~~~~~~~~~~~~~~~~"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "~~ This is a Fedora 22 install script."
echo "~~ src: Abhejit Rajagopal <rajagopal.abhejit@gmail.com>"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

MACHINE=arX86
LOCALHOME=/home/abhe

echo "We will install as root..."

echo "First things first.. set hostname:"
hostnamectl set-hostname ar$MACHINE

echo "Updates & Basics..."
dnf update && dnf -y install vim wget git lynx npm docker

echo "Pythons..."
dnf -y install python-devel numpy scipy python-imaging python-matplotlib python-pandas && dnf -y install python3-devel python3-numpy python3-scipy python3-imaging python3-matplotlib python3-pandas && pip install pip --upgrade && pip install ipython[all] && dnf -y install swig

echo "Desktop Environment..."
dnf -y groupinstall "Cinnamon Desktop" && echo "exec /usr/bin/cinnamon-session" >> $LOCALHOME/.xinitrc

echo "Now onto the applications..."
dnf -y update && mkdir Downloads && cd Downloads
# echo "We will break out of automated mode to install programs one-at-a-time, since we may have to review errors"

echo "Gedit"
dnf -y install gedit gedit-plugins

echo "Chrome"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm && dnf -y install lsb libXss.so.1 && rpm -iv google-chrome-stable_current_x86_64.rpm && rpm --import https://dl-ssl.google.com/linux/linux_signing_key.pub

echo "Blender"
# && source $HOME/.bashrc
