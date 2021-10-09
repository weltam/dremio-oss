git clone https://github.com/apache/arrow.git
# wget https://github.com/apache/arrow/archive/refs/tags/apache-arrow-4.0.0.tar.gz
# tar xvf apache-arrow-4.0.0.tar.gz
git checkout apache-arrow-4.0.0

git submodule update --init --recursive # Needed for flight

cd arrow

vcpkg install \
  --x-manifest-root cpp \
  --feature-flags=versions \
  --clean-after-build

cd cpp
rm -rf release && mkdir release && cd release
cmake .. -GNinja -DARROW_GANDIVA=ON -DARROW_GANDIVA_JAVA=ON -DARROW_ORC=ON -DARROW_PARQUET=ON -DARROW_DATASET=ON -DARROW_JNI=ON -DARROW_DEPENDENCY_SOURCE=BUNDLED
ninja
sudo ninja install

cd ../../java
mvn clean install
mvn install -P arrow-jni -am -Darrow.cpp.build.dir=/home/ubuntu/awsindo/dremio-gv2/graviton2/arrow/cpp/release/release -Dlicense.skip=true -e