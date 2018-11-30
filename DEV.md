## Setting up fablabs.io locally on ubuntu 16.04 LTS

sudo apt-get update -qq

sudo apt-get install -y \
  build-essential \
  libpq-dev \
  libqt4-dev \
  libqtwebkit-dev \
  postgresql-client \
  nodejs \
  imagemagick \
  npm \
  git

sudo apt-get install -y \
  ruby ruby-dev \
  memcached \
  postgresql \
  redis-server


cd
git clone https://github.com/fablabbcn/fablabs.io.git
cd fablabs.io

sudo gem install bundler

export NOKOGIRI_USE_SYSTEM_LIBRARIES=1

bundle config git.allow_insecure true

sudo apt-get install ruby-kgio
bundle update kgio raindrops

bundle install

> If this command complains
> change Gemfile ruby version to 2.3.1 or the one indicated

sudo npm install -g bower
sudo ln -sf `which nodejs` /usr/bin/node

bower install

** Setup headless x server for end to end testing **

### Requirements for webkit
#### https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit#debian--ubuntu
sudo apt-get install qt5-default libqt5webkit5-dev gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x

gem install capybara-webkit
sudo apt-get install xvfb
gem install headless


** Setup postgres and access control **

Edit pg_hba.conf and change the local connections from md5 to trust

Restart postgresql

sudo /etc/init.d/postgresql restart

** Create all dbs **

bundle exec rake db:create:all

** Run tests **

bundle exec rake

** Prepare Dev DB **

bundle exec rake db:migrate RAILS_ENV=development

** Start the dev server **

bundle exec rails s

** Setup an alias in /etc/hosts **

127.0.0.1  www.fablabs.local

Browse to http://www.fablabs.local:3000
