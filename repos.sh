# Solves the problem of issue of resolution reset after screen turn off
sudo add-apt-repository ppa:arter97/unity
# Google chrome
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

# update for all the added repos
sudo apt update
sudo apt upgrade
# install packages need from the above repos
sudo apt install google-chrome-stable
