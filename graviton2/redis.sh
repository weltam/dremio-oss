wget https://github.com/redis/redis/archive/refs/tags/2.8.18.tar.gz
tar xvf 2.8.18.tar.gz
cd redis-2.8.18
make
sudo apt-get install tcl
make test