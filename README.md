# FabLabs

[![Code Climate](https://codeclimate.com/github/fablabbcn/fablabs.png)](https://codeclimate.com/github/fablabbcn/fablabs) [![Build Status](https://travis-ci.org/fablabbcn/fablabs.png)](https://travis-ci.org/fablabbcn/fablabs) [![Test Coverage](https://codeclimate.com/github/fablabbcn/fablabs/badges/coverage.svg)](https://codeclimate.com/github/fablabbcn/fablabs/coverage)

## This is the official repository for fablabs.io platform project.

Fab labs provide widespread access to modern means for invention. They began as an outreach project from MIT’s Center for Bits and Atoms (CBA), and became into a collaborative and global network. You can find more information about Fab Labs on the [Fab Foundation Website](http://www.fabfoundation.org/).

If you are a Fab labs entusiast and/or you would like to contribute to the project please feel free to get in touch by [opening a new issue](https://github.com/fablabbcn/fablabs/issues/new).


## Setup

#### clone the repo

`git clone git@github.com:fablabbcn/fablabs.git`

#### install requirements

`brew install qt`

`brew install postgresql`

`npm install -g bower`

`bower install`

#### Setup environment variables

`cp ./config/application.example.yml ./config/application.yml`

#### create & setup database

`rake db:create db:migrate`

#### Run the rails server

`rails server`

#### Run Redis server for worker tasks

`redis-server`
