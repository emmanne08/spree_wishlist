# Spree Wishlist

[![Build Status](https://travis-ci.org/futhr/spree_wishlist.png)](https://travis-ci.org/futhr/spree_wishlist)
[![Dependency Status](https://gemnasium.com/futhr/spree_wishlist.png)](https://gemnasium.com/futhr/spree_wishlist)
[![Coverage Status](https://coveralls.io/repos/futhr/spree_wishlist/badge.png?branch=master)](https://coveralls.io/r/futhr/spree_wishlist)

**NOTE: This branch is WIP for Spree 2.0.0.beta. If you fork it remember to change .travis.yml notifications and links in above build statuses due to they point to futhr/spree_wishlist master branch.**

The Spree Wishlist extension enables multiple wishlists per user, as well as managing those
as public (sharable) and private. It also includes the ability to notify a friend via email
of a recommended product.

## Installation

1. Add the following to your Gemfile
```ruby
gem 'spree_wishlist', :git => 'git://github.com/spree/spree_wishlist.git'
gem 'spree_email_to_friend', :git => 'git://github.com/spree/spree_email_to_friend.git'
```

2. Run `bundle install`

3. To setup the asset pipeline includes and copy migrations run: `rails g spree_wishlist:install`

## Development

  * Fork the repo
  * clone your repo
  * Run `bundle`
  * Run `bundle exec rake test_app` to create the test application in `spec/test_app`.
  * Make your changes.
  * Ensure specs pass by running `bundle exec rake`
  * Submit your pull request

Copyright (c) 2013 John Dyer, released under the New BSD License
