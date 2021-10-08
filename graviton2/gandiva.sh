# git clone https://github.com/apache/arrow.git
wget https://github.com/apache/arrow/archive/refs/tags/apache-arrow-4.0.0.tar.gz
tar xvf apache-arrow-4.0.0.tar.gz

cd apache-arrow-4.0/cpp
rm -rf release && mkdir release && cd release
cmake .. -GNinja -DARROW_GANDIVA=ON -DARROW_GANDIVA_JAVA=ON -DARROW_DEPENDENCY_SOURCE=BUNDLED
ninja
ninja install