#!/bin/bash
# This file is meant to be executed via systemd.
source /usr/local/rvm/scripts/rvm
source /etc/profile.d/rvm.sh
export ruby_ver=$(rvm list default string)

export CONFIGURED=yes
export TIMEOUT=50
export APP_ROOT=/home/rails/chocolatshalba
export RAILS_ENV="production"
export GEM_HOME="/home/rails/chocolatshalba/vendor/bundle"
export GEM_PATH="/home/rails/chocolatshalba/vendor/bundle:/usr/local/rvm/gems/${ruby_ver}:/usr/local/rvm/gems/${ruby_ver}@global"
export PATH="/home/rails/chocolatshalba/vendor/bundle/bin:/usr/local/rvm/gems/${ruby_ver}/bin:${PATH}"

# Passwords
export SECRET_KEY_BASE=5a667455368729c29c52f60aea627e026b1a6f9e2da0a778cc1e1507e0b61d2fda98b579e219d568f54bbbb53659ed24e8751fbb024c5bfae05e434e2c4da911
export APP_DATABASE_PASSWORD=fe2ae514382b44874507e86a7fb469c5

# Execute the unicorn process
/home/rails/chocolatshalba/vendor/bundle/bin/unicorn \
        -c /etc/unicorn.conf -E production --debug
