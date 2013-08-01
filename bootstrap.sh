#!/usr/bin/env bash

NODE_VERSION=v0.10.13
RUBY_VERSION=2.0.0
GROOVY_VERSION=2.1.6
GRAILS_VERSION=2.2.3
NODETIME_VERSION=0.8.12
TESTEM_VERSION=0.3.7
UNDERSCORE_VERSION=1.4.4

apt-get update
apt-get install -y curl git python-software-properties unzip vim

su - vagrant -c 'curl https://raw.github.com/creationix/nvm/master/install.sh | sh'
su - vagrant -c "nvm install $NODE_VERSION"
su - vagrant -c 'printf "source ~/.nvm/nvm.sh\n" >> ~/.bash_profile'
su - vagrant -c "nvm alias default $NODE_VERSION"
su - vagrant -c "npm install -g yo grunt bower testem@$TESTEM_VERSION nodetime@$NODETIME_VERSION"
su - vagrant -c "cd ~/.nvm/$NODE_VERSION/lib/node_modules/testem/node_modules && npm install underscore@$UNDERSCORE_VERSION"

apt-get install -y gawk g++ make libyaml-dev libsqlite3-dev sqlite3 autoconf libgdbm-dev libncurses5-dev automake libtool bison pkg-config libffi-dev
su - vagrant -c "curl -L https://get.rvm.io | bash -s stable --ruby=$RUBY_VERSION"
su - vagrant -c 'gem install compass'

add-apt-repository -y ppa:webupd8team/java
apt-get update
echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections
apt-get install -y oracle-java6-installer

su - vagrant -c 'curl -s get.gvmtool.net | bash'
su - vagrant -c 'printf "gvm_auto_answer=true\ngvm_suggestive_selfupdate=true\n" > .gvm/etc/config'
su - vagrant -c 'source ~/.gvm/bin/gvm-init.sh'
su - vagrant -c "gvm i groovy $GROOVY_VERSION"
su - vagrant -c "gvm i grails $GRAILS_VERSION"

exit 0
