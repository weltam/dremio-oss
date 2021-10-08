wget https://github.com/aws/aws-sdk-cpp/archive/refs/tags/1.9.117.tar.gz
tar -xvf 1.9.117.tar.gz
cd aws-sdk
mkdir build && cd build

# or you can change to Ninja

cmake .. -DCMAKE_BUILD_TYPE=Debug -DCMAKE_PREFIX_PATH=/usr/local/bin
make
make install