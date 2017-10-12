#!/bin/bash

apt-get update && apt-get install -y nodejs
bundle install
bundle exec rake db:drop db:create db:migrate
