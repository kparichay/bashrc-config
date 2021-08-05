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
    # -R restow
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
# TODO: remove this once https://github.com/Optixal/neovim-init.vim/pull/15 is merged
sed -i '$ d' ~/.bashrc # remove the last line of bashrc by nvim
popd

#install scm breeze
pushd ~/.config/scm_breeze
./install.sh
popd

#### INSTALL REQUIRED SOFTWARES
# Google chrome
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

# vscode
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt install apt-transport-https

# update for all the added repos
sudo apt update
sudo apt upgrade -y

# install necessary packages
sudo apt install -y google-chrome-stable
sudo apt install -y vim code gitk
sudo apt install -y gnome-tweaks gnome-tweak-tool
sudo apt install -y nvidia-driver-460 nvidia-opencl-dev nvidia-prime nvidia-profiler
sudo apt install -y vlc gimp

# auto remove unnecessary items
sudo apt autoremove -y
