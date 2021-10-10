curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

export DREMIO_VERSION=17.0.0-202107060524010627-31b5222b
aws s3 cp distribution/server/target/dremio-oss-${DREMIO_VERSION}.tar.gz s3://dremio-gv2/