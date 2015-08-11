################################################################################
#### Fix KingsoftOffice font resolution issue								####
################################################################################
## src: http://linuxforums.org.uk/index.php?topic=11978.0
## src: http://wps-community.org/forum/viewtopic.php?f=4&t=618

cd /usr/share/fonts/wps-office ## make directory if not exist

sudo wget https://www.dropbox.com/s/lfy4hvq95ilwyw5/wps_symbol_fonts.zip

sudo unzip wps_symbol_fonts.zip

sudo fc-cache -vf
################################################################################
