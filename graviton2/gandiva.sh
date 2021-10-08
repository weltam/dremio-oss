git clone https://github.com/apache/arrow.git
cd arrow/cpp
rm -rf release && mkdir release && cd release
cmake .. -GNinja -DARROW_GANDIVA=ON -DARROW_GANDIVA_JAVA=ON -DARROW_DEPENDENCY_SOURCE=BUNDLED
ninja
ninja install