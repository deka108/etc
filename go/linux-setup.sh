# https://golang.org/doc/install

sudo su
apt update && apt install wget -y

# download and unzip go
LATEST_GO_VERSION=https://golang.org/dl/go1.15.3.linux-amd64.tar.gz
wget $LATEST_GO_VERSION
tar -C /usr/local -xzf go1.15.3.linux-amd64.tar.gz

# add to rc files
echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bashrc
