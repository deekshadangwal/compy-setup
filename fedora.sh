################################################################################
#### Notes for Fedora Setup:												####
################################################################################

## usage: (as desired user) sudo ./fedora.sh)

curdir=$(pwd) 

## update packages
dnf -y update

## install Cinnamon desktop environment (gtk compliant, mostly..)
dnf -y groupinstall "Cinnamon Desktop"
echo "exec /usr/bin/cinnamon-session" >> ~/.xinitrc

## install dev tools
dnf -y groupinstall "Development Tools"
dnf -y install curl git wget vim

## install pythons
dnf -y install python3-devel python3-numpy python3-scipy python3-pandas python3-scikit-learn python3-scikit-image python3-yaml python3-h5py python3-matplotlib python3-imaging
#pip3 install ipython[all] u-msgpack-pythons

# matlab support: http://www.mathworks.com/help/matlab/matlab_external/install-the-matlab-engine-for-python.html
MATLABROOT=/usr/local/MATLAB/R2015b/
cd "$MATLABROOT/extern/engines/python"
sudo python3 setup.py install
cd $curdir

## install sublime text
curl -L git.io/sublimetext | sh

pip3 install pyrtl networkx
