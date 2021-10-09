# wget https://github.com/google/flatbuffers/archive/refs/tags/v1.9.0.tar.gz

# tar -xvf v1.9.0.tar.gz

# cd flatbuffers-1.9.0

# https://gist.github.com/welly87/6497071f011c99c45c2b13dccaed5efb
# cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release
## should change to Ninja for faster compilation

git clone https://github.com/google/flatbuffers.git

cd flatbuffers

git checkout v1.12.0

rm -rf release && mkdir release && cd release

cmake .. -DFLATBUFFERS_CXX_FLAGS="-Wno-error" -DFLATBUFFERS_BUILD_TESTS="false" -DCMAKE_BUILD_TYPE=Release

make && sudo make install