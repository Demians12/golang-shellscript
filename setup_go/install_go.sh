#!/bin/bash

DESIRED_VERSION="1.21.0"

check_go_exists_and_update(){
  if command -v go &> /dev/null; then
    INSTALLED_VERSION=$(go version | awk '{print $3}' | sed 's/go//')
    if [ "$INSTALLED_VERSION" == "$DESIRED_VERSION" ]; then
      echo "Go version $DESIRED_VERSION is already installed."
      exit 0
    else
      echo "Installed Go version is $INSTALLED_VERSION. Updating to version $DESIRED_VERSION."
    fi
  fi
}

read -p "Please enter your operating system (linux/mac): " OS
if [[ "$OS" != "linux" && "$OS" != "mac" ]]; then
  echo "Invalid operating system, please run the script again and enter 'linux', 'mac'"
  exit 1
fi

check_go_exists_and_update

case $OS in 
      'mac')
        brew upgrade go || brew install go 
        ;;
      'linux')
         sudo apt-get update 
         wget https://golang.org/dl/go1.21.0.linux-amd64.tar.gz
         sudo tar -C /usr/local -xzf go1.21.0.linux-amd64.tar.gz
         echo  "PATH=$PATH:/usr/local/go/bin" >> ~/.bashrc
         source ~/.bashrc
         go version
         rm "go$DESIRED_VERSION.linux-amd64.tar.gz"
         ;;
esac

