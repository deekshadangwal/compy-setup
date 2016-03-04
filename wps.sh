################################################################################
#### Install KingsoftOffice suite											####
################################################################################
## WPS Office suite: http://wps-community.org/downloads
wget http://kdl.cc.ksosoft.com/wps-community/download/a20/wps-office-10.1.0.5503-1.a20p2.i686.rpm
wget http://kdl.cc.ksosoft.com/wps-community/download/a15/wps-office-fonts-1.0-1.noarch.rpm
sudo nemo . &

# ## Fix font issue (not sure if needed?)
# src: http://linuxforums.org.uk/index.php?topic=11978.0
# src: http://wps-community.org/forum/viewtopic.php?f=4&t=618

# cd /usr/share/fonts/wps-office ## make directory if not exist
# sudo wget https://www.dropbox.com/s/lfy4hvq95ilwyw5/wps_symbol_fonts.zip
# sudo unzip wps_symbol_fonts.zip
# sudo fc-cache -vf
################################################################################
