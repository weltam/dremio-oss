wget https://github.com/google/flatbuffers/archive/refs/tags/v1.9.0.tar.gz

tar -xvf v1.9.0.tar.gz

cd flatbuffers-1.9.0

# https://gist.github.com/welly87/6497071f011c99c45c2b13dccaed5efb
# cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release
## should change to Ninja for faster compilation

sudo rm -rf build

mkdir build && cd build

cmake .. -D FLATBUFFERS_CXX_FLAGS="-Wno-error" -D FLATBUFFERS_BUILD_TESTS="false" -DCMAKE_BUILD_TYPE=Release

#ninja
make

# sudo ninja install
sudo make install