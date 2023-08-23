#!/bin/bash

check_go_exists(){
    if command -v go version &> /dev/null; then
       echo "Go is already installed"
       exit 0
    fi
}

read -p "Please enter your operating system (linux/mac/windows): " OS
if [[ "$OS" != "linux" && "$OS" != "windows" && "$OS" != "mac" ]]; then
  echo "Invalid operating system, please run the script again and enter 'linux', 'mac' or 'windows'"
  exit 1
fi

check_go_exists

case $OS in 
      'mac')
        brew install go
        ;;
      'linux')
         sudo apt-get update 
         wget https://golang.org/dl/go1.21.0.linux-amd64.tar.gz
         sudo tar -C /usr/local -xzf go1.21.0.linux-amd64.tar.gz
         echo  "PATH=$PATH:/usr/local/go/bin" >> ~/.bashrc
         go version
         rm go1.21.0.linux-amd64.tar.gz
         ;;
       'windows')
         Invoke-WebRequest -Uri "https://golang.org/dl/go1.21.0.windows-amd64.msi" -OutFile "go1.21.0.windows-amd64.msi"
         Start-Process -FilePath "go1.21.0.windows-amd64.msi" -Wait
         go version
         Remove-Item "go1.21.0.windows-amd64.msi"
         ;;
esac

