#!/bin/bash
set +e
cd /tmp

# screen and a decent default config
sudo apt-get -y install screen
( cat <<'EOP'
zombie q
termcapinfo xterm*|rxvt*|kterm*|Eterm* ti@:te@
hardstatus alwayslastline "%{rk}%H %{gk}%c %{yk}%M%d %{wk}%?%-Lw%?%{bw}%n*%f %t%?(%u)%?%{wk}%?%+Lw%?"
bind R eval "source $HOME/.screenrc" "echo '.screenrc reloaded!'"
EOP
) > ~vagrant/.screenrc

# git and .gitconfig pointer
sudo apt-get -y install git
ln -s /vagrant/.gitconfig ~/.gitconfig

# pip and virtualenv
sudo apt-get -y install python-dev python-pip
sudo pip install virtualenv
sudo pip install -U distribute

# ipython, pandas, matplotlib, etc.
sudo apt-get -y install freetype* libpng-dev g++
sudo pip install pyzmq
sudo pip install jinja2
sudo pip install ipython
sudo pip install numpy
sudo pip install pandas
sudo pip install matplotlib
sudo pip install scipy
sudo pip install scikit-learn

# behave
sudo pip install behave

# nodejs, npm, nvm
wget -qO- https://raw.github.com/creationix/nvm/master/install.sh | sh
. /home/vagrant/.profile
echo '. /home/vagrant/.profile' >> /home/vagrant/.bash_profile
nvm install v0.10.22
nvm alias default v0.10.22

# express, mocha, and bower
npm install -g bower mocha
npm cache clean

# rvm, ruby
\curl -L https://get.rvm.io | bash -s stable
. /home/vagrant/.rvm/scripts/rvm
rvm install 1.9.3
