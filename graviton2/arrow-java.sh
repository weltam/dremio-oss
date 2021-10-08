# details is here https://github.com/apache/arrow/tree/master/java
# git submodule update --init --recursive # Needed for flight
# download the release tar.gz 
cd java
mvn install
mvn install -P arrow-jni -am -Darrow.cpp.build.dir=/home/ubuntu/awsindo/dremio-gv2/arrow-apache-arrow-4.0.0/cpp/build