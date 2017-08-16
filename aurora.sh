#!/bin/bash

# first, update ubuntu:
sudo apt-get update --fix-missing
sudo apt-get install -y --fix-missing apt-utils dialog locate cpio htop # first, some admin utilities
apt-get install -y --fix-missing libreadline-dev libncurses5-dev # handle writing to the screen
DEBIAN_FRONTEND=noninteractive apt-get install -y --fix-missing linux-generic linux-headers-generic # kernel headers
apt-get install -y --fix-missing build-essential gcc gpp make cmake pkg-config libboost-all-dev # compiler utils
apt-get install -y --fix-missing ca-certificates git curl wget vim unzip python-dev npm # some basic utils
apt-get install -y --fix-missing software-properties-common python-software-properties # lets you add-apt-repository

# turn on firewall:
sudo ufw enable

# multimedia supoprt
apt-get install -y libtbb2 libtbb-dev libjpeg8-dev libtiff5-dev libpng12-dev libdc1394-22-dev # img #libjasper, jasper?
apt-get install -y libavcodec-dev libavformat-dev libswscale-dev libv4l-dev # video

# matrix operations
apt-get install -y libatlas-base-dev gfortran

# get intel python:
echo '--> Getting python...' # my serial number: CTGC-V68SLW48
check=$(which python3)
python_name=python35
if [ $check == '/opt/intel/intelpython35/bin//python3' ]; then
  echo "** got python already! **"
else
  if [ $platform == 'linux' ] && [ '$(which python3)' != '/opt/intel/intelpython35/bin//python3' ]; then
    curl -L http://registrationcenter-download.intel.com/akdlm/irc_nas/tec/11602/l_python3_pu3_2017.3.052.tgz -o ${python_name}.tgz
    installdir=./l_python3_pu3_2017.3.052
  elif [ $platform == 'mac' ] && [ '$(which python3)' != '/opt/intel/intelpython35/bin//python3' ]; then
    curl -L http://registrationcenter-download.intel.com/akdlm/irc_nas/tec/11607/intelpython35-2017.3.053.tgz -o ${python_name}.tgz
    installdir=./intelpython35-2017.3.053.app/Contents/MacOS
  fi
  chmod 777 ${python_name}.tgz
  tar -xzvf ${python_name}.tgz
  sed -i -e 's/ACCEPT_EULA=decline/ACCEPT_EULA=accept/' ${installdir}/silent.cfg
  sed -i -e 's/COMPONENTS=DEFAULTS/COMPONENTS=ALL/' ${installdir}/silent.cfg
  ${installdir}/install.sh --silent ${installdir}/silent.cfg
  printf "PATH=/opt/intel/intelpython3/bin/:\$PATH \n" >> ~/.bash_profile
  # printf "export PATH \n" >> ~/.bash_profile # is this needed? NO.
  source ~/.bash_profile
fi

#pythons:
sudo apt-get install python-pip python3-pip
pip3 install pyrtl
pip3 install numpy
pip3 install scipy
pip3 install scikit-learn
pip3 install pandas
pip3 install matplotlib
pip3 install keras
