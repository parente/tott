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
sudo pip install pip==1.4.1
sudo pip install virtualenv==1.10.1
sudo pip install -U distribute==0.7.3

# ipython, pandas, matplotlib, etc.
sudo apt-get -y install freetype* libpng-dev g++ gfortran liblapack-dev
sudo pip install pyzmq==14.0.1
sudo pip install jinja2==2.7.1
sudo pip install ipython==1.1.0
sudo pip install numpy==1.8.0
sudo pip install pandas==0.12.0
sudo pip install matplotlib==1.3.1
sudo pip install scipy==0.13.2
sudo pip install scikit-learn==0.14.1
# clean up compile time deps
sudo apt-get -y remove gfortran liblapack-dev

# behave
sudo pip install behave==1.2.3

# nodejs, npm, nvm
wget -qO- https://raw.github.com/creationix/nvm/master/install.sh | sh
. /home/vagrant/.profile
echo '. /home/vagrant/.profile' >> /home/vagrant/.bash_profile
nvm install v0.10.22
nvm alias default v0.10.22

# mocha and bower
npm install -g bower@1.2.7
npm cache clean

# rvm, ruby
\curl -L https://get.rvm.io | bash -s stable
. /home/vagrant/.rvm/scripts/rvm
rvm install 1.9.3
