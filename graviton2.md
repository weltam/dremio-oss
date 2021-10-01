# java 8

```sh
sdk install java 8.0.302-zulu

sdk use java 8.0.302-zulu
sdk default java 8.0.302-zulu
```

# install python2

```sh
sudo apt update
sudo apt-get install build-essential
sudo apt install python2-minimal
```

# install flatbufferc

```sh
wget https://github.com/google/flatbuffers/archive/refs/tags/v1.9.0.tar.gz

tar -xvf v1.9.0.tar.gz

cd flatbuffers-1.9.0


# https://gist.github.com/welly87/6497071f011c99c45c2b13dccaed5efb
# cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release

sudo rm -rf build

mkdir build && cd build

cmake .. -D FLATBUFFERS_CXX_FLAGS="-Wno-error" -D FLATBUFFERS_BUILD_TESTS="false" -DCMAKE_BUILD_TYPE=Release

make

sudo make install
```

# install protobuf

```sh
sudo apt install protobuf-compiler
```

https://stackoverflow.com/questions/55394537/how-to-install-flatc-and-flatbuffers-on-linux-ubuntu

# compile dremio on graviton2

```sh
git clone https://github.com/dremio/dremio-oss.git dremio

cd dremio

# ./mvnw clean install -DskipTests -Dlicense.skip=true -Ddremio.oss-only=true

# ./mvnw -T 1C compile -DskipTests -Dmaven.test.skip

# temporary skip ui
# ./mvnw -T 1C clean compile -DskipTests -Dmaven.test.skip
# ./mvnw -T 1C clean compile -DskipTests -Dmaven.test.skip --offline

# clean & with internet
./mvnw -T 1C clean install -DskipTests -Dmaven.test.skip -Ddremio.oss-only=true

# no internet
./mvnw -T 1C clean install -DskipTests -Dmaven.test.skip --offline

# don't clean
./mvnw -T 1C install -DskipTests -Dmaven.test.skip

# compile spesific projects
./mvnw -T 1C clean compile -pl tools -am -DskipTests -Dmaven.test.skip --offline
./mvnw -T 1C compile -pl protocol -am -DskipTests -Dmaven.test.skip --offline
```

# speed up maven build

https://www.jrebel.com/blog/how-to-speed-up-your-maven-build

https://mincong.io/2018/11/01/speed-up-the-maven-build/

https://stackoverflow.com/questions/32368976/ways-to-make-maven-build-faster
