# java 8

```sh
sdk install java 8.0.302-zulu

sdk use java 8.0.302-zulu

sdk default java 8.0.302-zulu

sdk default java 11.0.12-zulu
```

# install linux build tools

```shell
sudo apt update

sudo apt install build-essential pkg-config flex bison \
                 autoconf automake libtool make tar gcc \
                 libcurl-dev libcurl4-openssl-dev \
                 libaio-dev libssl-dev libapr1-dev \
                 lksctp-tools libsnappy-dev \
                -y

sudo apt install clang-13 lldb-13 lld-13 clangd-13 -y

sudo snap install cmake --classic
```

# nodejs

```sh
sudo apt install npm -y
```

# install python2

```sh
sudo apt install python2-minimal -y
```
# install vcpkg

CMake projects should use: "-DCMAKE_TOOLCHAIN_FILE=/home/ubuntu/vcpkg/scripts/buildsystems/vcpkg.cmake"

# install protobuf

```sh
# sudo apt install protobuf-compiler
# sudo apt remove protobuf-compiler
```

# fixing sentry cli

execute or run dac-ui.sh for patching the nodejs ui 

```shell
graviton2/dac-ui.sh
```

reference
1. https://github.com/getsentry/sentry-cli
1. https://stackoverflow.com/questions/62971089/npm-install-use-built-package-for-arm-processor-sentry
1. https://github.com/getsentry/sentry-cli/issues/592



# fix rockdb

we can just change version to 6.4.6

```xml
<rocksdb.version>6.4.6</rocksdb.version>
```

reference

1. https://github.com/facebook/rocksdb/issues/5559#issuecomment-559003725
1. https://github.com/facebook/rocksdb/wiki/RocksJava-Basics


# fix open ssl


## install open ssl
https://fedingo.com/how-to-install-openssl-in-ubuntu/ 

## change open ssl dependencies version

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

# install flatbufferc

```sh
graviton2/flatbuffer.sh
```

Reference
https://stackoverflow.com/questions/55394537/how-to-install-flatc-and-flatbuffers-on-linux-ubuntu


# redis 2.8.19

this require the redis binaries. run this script to build redis

```sh
graviton2/redis.sh
```

we can compile and build from source and link to java wrapper

https://github.com/ozimov/embedded-redis

but i just change the code in dremio redis source by pointing to the location of the redis executable


# compile gandiva

## build aws sdk

```sh
graviton2/aws-sdk.sh
```

## compile llvm

```shell
graviton2/llvm.sh
```

reference

1. https://llvm.org/docs/HowToBuildOnARM.html
1. https://llvm.org/docs/GettingStarted.html

## compile arrow-gandiva

```shell
graviton2/gandiva.sh
```

Reference 

1. https://graspingtech.com/upgrade-cmake/
1. https://arrow.apache.org/install/


## issues arrow with apple m1

1. https://uwekorn.com/2021/01/04/first-two-weeks-with-the-m1.html
1. https://uwekorn.com/2021/01/04/first-two-weeks-with-the-m1.html


# compile arrow java

## change netty dependencies in apache arrow java/pom.xml

```xml
<dep.netty.version>4.1.60.Final</dep.netty.version>
```

## build arrow java library

https://github.com/apache/arrow/tree/master/java

```sh
graviton2/arrow-java.sh
# git submodule update --init --recursive # Needed for flight
# cd java
# mvn install
# mvn install -P arrow-jni -am -Darrow.cpp.build.dir=/home/ubuntu/awsindo/arrow/cpp/build
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

./mvnw -T 1C clean install -Dlicense.skip=true -Ddremio.oss-only=true -e

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

1. https://www.jrebel.com/blog/how-to-speed-up-your-maven-build
1. https://mincong.io/2018/11/01/speed-up-the-maven-build/
1. https://stackoverflow.com/questions/32368976/ways-to-make-maven-build-faster

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


# Notes

## disable logging 

https://mkyong.com/logging/logback-disable-logging-in-unit-test/


## add dremio maven repository

1. dremio-free
1. dremio-public

```xml
  <repositories>
    <repository>
      <id>dremio-public</id>
      <url>https://maven.dremio.com/public/</url>
    </repository>
    <repository>
      <id>dremio-free</id>
      <url>https://maven.dremio.com/free/</url>
    </repository>
  </repositories>
```


### remove tpc data for testing (optional)

https://community.dremio.com/t/build-failure-with-ddremio-oss-only/6638/4

disable tpc data from dremio maven repository

https://community.dremio.com/t/dremio-oss-build-error/6025/5

## Title