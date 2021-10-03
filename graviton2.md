# install linux build tools

```sh
sudo apt install build-essential pkg-config flex bison libcurl-dev libcurl4-openssl-dev
```

# nodejs

```sh
sudo apt install npm
```

# fixing sentry cli
```sh
cd dremio-oss/dac/ui

npm install @sentry/cli
```

ref
https://github.com/getsentry/sentry-cli
https://stackoverflow.com/questions/62971089/npm-install-use-built-package-for-arm-processor-sentry
https://github.com/getsentry/sentry-cli/issues/592

# java 8

```sh
sdk install java 8.0.302-zulu

sdk use java 8.0.302-zulu
sdk default java 8.0.302-zulu
```

# fix rockdb

change version to 6.4.6

```xml
<rocksdb.version>6.4.6</rocksdb.version>
```

ref

https://github.com/facebook/rocksdb/issues/5559#issuecomment-559003725

https://github.com/facebook/rocksdb/wiki/RocksJava-Basics

# install open ssl

https://fedingo.com/how-to-install-openssl-in-ubuntu/ 

# fix open ssl issues

https://github.com/wildfly-security/wildfly-openssl

```xml
    <dependency>
        <groupId>org.wildfly.openssl</groupId>
        <artifactId>wildfly-openssl-java</artifactId>
        <version>${project.version}</version>
    </dependency>
```

if you want to recompile and bundle native libs follow this

https://support.huaweicloud.com/intl/en-us/prtg-tpdl-kunpengbds/kunpengwildflyopenssl_02_0004.html

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

Reference
https://stackoverflow.com/questions/55394537/how-to-install-flatc-and-flatbuffers-on-linux-ubuntu
```

# install protobuf

```sh
sudo apt install protobuf-compiler
```

# build aws sdk


```sh
mkdir build && cd build

cmake .. -DCMAKE_BUILD_TYPE=Debug -DCMAKE_PREFIX_PATH=/usr/local/bin
make
make install
```

# install llvm

https://llvm.org/docs/HowToBuildOnARM.html

```sh
git clone https://github.com/llvm/llvm-project.git
cd llvm-project
mkdir build
cd build
cmake .. -G Ninja -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra;lldb;" \
                    -DCMAKE_BUILD_TYPE=Release \
                    -DLLVM_TARGETS_TO_BUILD="ARM;AArch64" ../llvm

ninja 
ninja install
```

additional

https://llvm.org/docs/GettingStarted.html



# install arrow

```sh
# upgrade cmake
sudo snap install cmake --classic

# sudo apt install clang-13 lldb-13 lld-13 clangd-13


git clone https://github.com/Microsoft/vcpkg.git
cd vcpkg
./bootstrap-vcpkg.sh
./vcpkg integrate install
# ./vcpkg install arrow

export VCPKG_FORCE_SYSTEM_BINARIES=1
./vcpkg install arrow

git clone https://github.com/apache/arrow.git

cd arrow

export VCPKG_FORCE_SYSTEM_BINARIES=1

vcpkg install \
  --x-manifest-root cpp \
  --feature-flags=versions \
  --clean-after-build

git clone https://github.com/apache/arrow.git
cd arrow/cpp
rm -rf release && mkdir release && cd release
cmake .. -GNinja -DARROW_GANDIVA=ON -DARROW_GANDIVA_JAVA=ON -DARROW_DEPENDENCY_SOURCE=BUNDLED
ninja
ninja install 
# make
```

ref
https://graspingtech.com/upgrade-cmake/
https://arrow.apache.org/install/

# issues arrow with apple m1
https://uwekorn.com/2021/01/04/first-two-weeks-with-the-m1.html
https://uwekorn.com/2021/01/04/first-two-weeks-with-the-m1.html

# compile arrow java

## compile netty

```sh
sudo apt-get install autoconf automake libtool make tar gcc \
                  libaio-dev libssl-dev libapr1-dev \
                  lksctp-tools libsnappy-dev
```

## change netty dependencies

```xml
<dep.netty.version>4.1.60.Final</dep.netty.version>
```


https://github.com/apache/arrow/tree/master/java

```sh
git submodule update --init --recursive # Needed for flight
cd java
mvn install
mvn install -P arrow-jni -am -Darrow.cpp.build.dir=/home/ubuntu/awsindo/arrow/cpp/build
```

# compile dremio on graviton2

```sh
git clone https://github.com/dremio/dremio-oss.git dremio

cd dremio

# ./mvnw clean install -DskipTests -Dlicense.skip=true -Ddremio.oss-only=true

# temporary skip ui
# ./mvnw -T 1C clean compile -DskipTests -Dmaven.test.skip
# ./mvnw -T 1C clean compile -DskipTests -Dmaven.test.skip --offline

# full build

./mvnw -T 1C clean install -Ddremio.oss-only=true

# clean & with internet
./mvnw -T 1C clean install -DskipTests -Dmaven.test.skip=true -Ddremio.oss-only=true -e

./mvnw -T 1C install -DskipTests -Dmaven.test.skip -Ddremio.oss-only=true

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

# run dremio

```sh


# start
export DREMIO_VERSION=17.0.0-202107060524010627-31b5222b
distribution/server/target/dremio-oss-${DREMIO_VERSION}/dremio-oss-${DREMIO_VERSION}/bin/dremio start

# stop
distribution/server/target/dremio-oss-${DREMIO_VERSION}/dremio-oss-${DREMIO_VERSION}/bin/dremio stop
```

# login dremio web

http://localhost:9047


# add nessie jar

```xml
<!-- https://mvnrepository.com/artifact/org.projectnessie/nessie-server-store -->
<dependency>
    <groupId>org.projectnessie</groupId>
    <artifactId>nessie-server-store</artifactId>
    <version>0.4.0</version>
</dependency>
```


```sh
cd distribution/server/target/dremio-oss-${DREMIO_VERSION}/dremio-oss-${DREMIO_VERSION}/jars
wget https://repo1.maven.org/maven2/org/projectnessie/nessie-server-store/0.4.0/nessie-server-store-0.4.0.jar
wget https://repo1.maven.org/maven2/org/projectnessie/nessie-model/0.4.0/nessie-model-0.4.0.jar
wget https://repo1.maven.org/maven2/org/projectnessie/nessie-services/0.4.0/nessie-services-0.4.0.jar
wget https://repo1.maven.org/maven2/org/projectnessie/nessie-versioned-memory/0.4.0/nessie-versioned-memory-0.4.0.jar
wget https://repo1.maven.org/maven2/org/projectnessie/nessie-versioned-spi/0.4.0/nessie-versioned-spi-0.4.0.jar
wget https://repo1.maven.org/maven2/org/projectnessie/nessie-versioned-tests/0.4.0/nessie-versioned-tests-0.4.0.jar
```
