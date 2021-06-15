#!/usr/bin/env bash
set -e

# install necessary items for the setup
sudo apt update
sudo apt install -y stow git zsh

#### SETUP DEPENDENT CONFIGS
# setup submodules
git submodule update --init

# run the stow command for the passed in directory ($2) in corresponding dots in home
stowit() {
    APP=$1

    if [ "${APP}" == "bash" ]; then
        TARGET=${HOME}
    else
        TARGET=${HOME}/${APP}
    fi
    mkdir -p ${TARGET}

    # -v verbose
    # -R recursive
    # -t target
    echo "stow -v -R -t ${TARGET} ${APP}"
    stow -v -R -t ${TARGET} ${APP}
}

#### COPY DEPEDENT CONFIGS
# Application files to be installed
APPS=( bash bin .config .vim )

# install apps available to local users and root
# if [ -f "${HOME}/.bashrc" && ! \( -L "${HOME}/.bashrc" \) ]; then
if [ -f "${HOME}/.bashrc" ]; then
  mv ${HOME}/.bashrc ${HOME}/.bashrc.bak
fi
for app in ${APPS[@]}; do
    stowit ${app}
done

#### INSTALL DEPENDENT CONFIGS
# install fzf
pushd ~/.config/fzf
source ~/.config/fzf/install --xdg --all --no-update-rc
popd

# install tldr
pushd ~/.config/
stow -v -t ${HOME}/bin tldr
popd
chmod +x ${HOME}/bin/tldr

# install neovim
pushd ~/.config/
pushd neovim-init.vim
python3 -m install doq
./install.sh
popd
cp init.vim nvim/
popd

#### INSTALL REQUIRED SOFTWARES
# Google chrome
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

# github cli
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
sudo apt-add-repository https://cli.github.com/packages

# update for all the added repos
sudo apt update
sudo apt upgrade -y

# install necessary packages
sudo apt install -y google-chrome-stable
sudo apt install -y vim gh
sudo apt install -y gnome-tweaks gnome-tweak-tool
sudo apt install -y nvidia-driver-460 nvidia-opencl-dev nvidia-prime nvidia-profiler
sudo apt install -y vlc gimp

# auto remove unnecessary items
sudo apt autoremove -y
