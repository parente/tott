#!/bin/bash
set -e
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

# ipython, virtualenv + wrapper, pip
sudo apt-get -y install python-dev python-pip
sudo pip install virtualenv
sudo pip install virtualenvwrapper
sudo pip install ipython

# nodejs, npm, nvm
wget -qO- https://raw.github.com/creationix/nvm/master/install.sh | sh
. /home/vagrant/.profile
echo '. /home/vagrant/.profile' >> /home/vagrant/.bash_profile
nvm install v0.10.13
nvm alias default v0.10.13

# yeoman, grunt, bower, generators for yeoman
# need fontconfig else phantomjs goes kaput
sudo apt-get -y install fontconfig
npm install -g phantomjs yo grunt-cli bower generator-express generator-backbone generator-mocha

# mongodb
sudo apt-get -y install mongodb

# sphinx, hieroglyph, groc
sudo pip install sphinx
sudo pip install hieroglyph
npm install -g groc

# ruby, cf
\curl -L https://get.rvm.io | bash -s stable
. /home/vagrant/.rvm/scripts/rvm
rvm install 1.9.3
#rvm gemset create cf
#rvm use 1.9.3@cf --default
gem install cf --no-ri --no-rdoc
# need compass for some yeoman grunt tasks
gem install compass --no-ri --no-rdoc

# python fabric, nose, behave
sudo pip install fabric
sudo pip install nose
sudo pip install behave

# mocha
npm install -g mocha

# pandas, matplotlib, notebook
sudo apt-get -y install freetype* libpng-dev
# fails if all three on the same line ...
sudo pip install numpy
sudo pip install pandas
sudo pip install matplotlib
