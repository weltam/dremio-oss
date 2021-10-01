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
