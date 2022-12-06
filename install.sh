#!/bin/bash
sudo apt install zsh git curl
cd ~ || exit
sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.2/zsh-in-docker.sh)"
wget -O .zshrc https://raw.githubusercontent.com/AresM3/docker-oh-my-zsh/master/.zshrc
wget -O .bashrc https://raw.githubusercontent.com/AresM3/docker-oh-my-zsh/master/.bashrc
is_docker=false
while getopts :d options;
do
  # shellcheck disable=SC2220
  case "$options" in
    d) is_docker=true ;;
  esac
done
if $is_docker; then
  wget -O .p10k.zsh https://raw.githubusercontent.com/AresM3/docker-oh-my-zsh/master/.p10k.zsh
else
  wget -O .p10k.zsh https://raw.githubusercontent.com/AresM3/docker-oh-my-zsh/master/.p10k.std.zsh
fi