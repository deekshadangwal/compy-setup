cd $HOME && mkdir -p localapps && cd localapps

# BLENDER
wget http://mirror.cs.umn.edu/blender.org/release/Blender2.74/blender-2.74-linux-glibc211-x86_64.tar.bz2 && tar -xvf blender-2.74-linux-glibc211-x86_64.tar.bz2 && mv blender-2.74-linux-glibc211-x86_64 Blender-2.74 && echo 'alias blender=$HOME/localapps/Blender-2.74/blender' >> $HOME/.bashrc && source ~/.bashrc && rm blender-2.74-linux-glibc211-x86_64.tar.bz2 # this gets blender app

git clone http://git.blender.org/blender.git && cd blender && git submodule update --init --recursive && git submodule foreach git checkout master && git submodule foreach git pull --rebase origin master && build_files/build_environment/install_deps.sh --with-all --skip-osl && sudo make bpy && cd .. && rm -rf blender # this gets bpy python module

# MEEP
sudo dnf install gcc-gfortran guile guile-devel libctl
wget http://ab-initio.mit.edu/libctl/libctl-3.2.2.tar.gz
tar -xvf libctl-3.2.2.tar.gz
#rm libctl-3.2.2.tar.gz
cd libctl-3.2.2
./configure LIBS="-lm"
make
sudo make install
cd ..
rm -rf libctl-3.2.2

sudo dnf install fftw-devel blas-devel lapack-devel gsl-devel mpi-devel hdf5-openmpi-devel hdf5-devel
wget http://ab-initio.mit.edu/harminv/harminv-1.4.tar.gz
tar -xvf harminv-1.4.tar.gz
#rm harminv-1.4.tar.gz
cd harminv-1.4/
./configure
make
sudo make install
cd ..
rm -rf harminv-1.4

wget http://ab-initio.mit.edu/meep/meep-1.3.tar.gz # MEEP
tar -xvf meep-1.3.tar.gz
#rm meep-1.3.tar.gz
cd meep-1.3
./configure --with-mpi -l/usr/lib64/openmpi/ >> ./meeplog.log
make
make check
sudo make install
make installcheck
cd ..
rm -rf meep-1.3
#echo 'alias meep=$appsfolder$"/my_meep/bin/meep"' >> ~/.bashrc

#vim ~/.bashrc
source ~/.bashrc

wget https://launchpad.net/python-meep/1.4/1.4/+download/python-meep-1.4.2.tar # Python-Meep
tar -xvf python-meep-1.4.2.tar
cd python-meep
python setup.py install -I/usr/local/include -L/usr/local/lib

# OPENEMS
sudo dnf -y install make gcc gcc-c++ git hdf5-devel vtk-devel boost-devel CGAL-devel tinyxml-devel qt-devel vtk-qt

sudo dnf -y install octave octave-devel epstool transfig gengetopt help2man groff perl-pod2pdf bison flex libharu-devel libtool autoconf

git clone -b stable https://github.com/thliebig/openEMS-Project.git
cd openEMS-Project
# hyp2mat failure fix:replace parse.h with parse.hh in hyp2mat/Makefile.am and hyp2mat/libscan.ll?
./update_openEMS.sh ~/$appsfolder/openEMS --with-hyp2mat --with-CTB
cd ..
rm -rf openEMS-Project

# OCTAVE
sudo vim /usr/share/gtksourceview-3.0/language-specs/octave.lang # fix gedit comment from # to %


