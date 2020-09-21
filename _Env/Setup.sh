#!/usr/bin/env bash

function _ImmDbSetupTools()
{
  sudo apt-get update
  sudo apt-get install -y python-setuptools
  sudo apt-get install -y python3-venv
  sudo apt-get install -y gcc
  sudo apt-get install -y python3-dev
  sudo apt-get install -y python3-setuptools
  sudo apt-get install -y libdpkg-perl
  sudo apt-get install -y mariadb-server
  sudo apt-get install -y mariadb-client
  sudo apt-get install -y make
  sudo apt-get install -y wget
  sudo apt-get install -y unzip
  sudo apt-get install -y git
  sudo apt-get install -y npm
  sudo apt-get install -y r-base
  sudo apt-get install -y build-essential
}
function _ImmDbSetupDocker()
{
  #Update the apt package index and install packages to allow apt to use a repository over HTTPS:
  sudo apt-get update

  sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

  #nstall the latest version of Docker Engine and containerd
  sudo apt-get update
  sudo apt-get install -y docker.io

  sudo docker pull hello-world
  sudo docker images
  sudo docker run hello-world
}

function _ImmDbSetupLocal()
{
  echo "Install MySql server"
  sudo apt install -y mysql-server
  sudo mysql_secure_installation
  #sudo mysql
  #systemctl status mysql.service

  echo "Install MySql workbench"
  sudo apt-get update
  sudo snap install mysql-workbench-community

  echo  "Install R"
  sudo apt install r-base
  R --version
}
function ImmDbInstDocker()
{
  sudo docker pull arosenfeld/immunedb
  sudo docker run -v $HOME/immunedb_share:/share  -p 8080:8080 -it arosenfeld/immunedb
}

function ImmDbInstLocal()
{
  mkdir ~/apps
  cd ~/apps

  # Get the frontend source, clearcut, and bowtie2
  sudo git clone https://github.com/arosenfeld/immunedb-frontend

  sudo wget http://bioinformatics.hungry.com/clearcut/clearcut-1.0.9.tar.gz
  sudo tar xzf clearcut-1.0.9.tar.gz
  sudo  mv clearcut-1.0.9 clearcut

  sudo wget https://github.com/BenLangmead/bowtie2/releases/download/v2.3.4.1/bowtie2-2.3.4.1-linux-x86_64.zip
  sudo unzip bowtie2-2.3.4.1-linux-x86_64.zip
  sudo mv bowtie2-2.3.4.1-linux-x86_64 bowtie2

}