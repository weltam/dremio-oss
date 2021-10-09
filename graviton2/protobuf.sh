sudo apt-get install autoconf automake libtool curl make g++ unzip
git clone https://github.com/protocolbuffers/protobuf.git
cd protobuf
git checkout v3.5.0
git submodule update --init --recursive
./autogen.sh

 ./configure
 make
 make check
 sudo make install
 sudo ldconfig # refresh shared library cache.