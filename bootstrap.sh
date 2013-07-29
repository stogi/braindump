#!/usr/bin/env bash

NODE_VERSION=v0.11.4
RUBY_VERSION=2.0.0

apt-get update
apt-get install -y curl git git-flow unzip vim

su - vagrant -c 'curl https://raw.github.com/creationix/nvm/master/install.sh | sh'
su - vagrant -c "nvm install $NODE_VERSION"
su - vagrant -c 'printf "source ~/.nvm/nvm.sh\n" >> ~/.bash_profile'
su - vagrant -c "nvm alias default $NODE_VERSION"
su - vagrant -c 'npm install -g yo grunt bower testem'

apt-get install -y gawk g++ make libyaml-dev libsqlite3-dev sqlite3 autoconf libgdbm-dev libncurses5-dev automake libtool bison pkg-config libffi-dev
su - vagrant -c "curl -L https://get.rvm.io | bash -s stable --ruby=$RUBY_VERSION"
su - vagrant -c 'gem install compass'

apt-get install -y openjdk-7-jdk
su - vagrant -c 'curl -s get.gvmtool.net | bash'
su - vagrant -c 'printf "gvm_auto_answer=true\ngvm_suggestive_selfupdate=true\n" > .gvm/etc/config'
su - vagrant -c 'source ~/.gvm/bin/gvm-init.sh'
su - vagrant -c 'gvm i groovy'
su - vagrant -c 'gvm i grails'

exit 0
