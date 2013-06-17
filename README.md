# Spree Wishlist

[![Build Status](https://travis-ci.org/futhr/spree_wishlist.png)](https://travis-ci.org/futhr/spree_wishlist)
[![Dependency Status](https://gemnasium.com/futhr/spree_wishlist.png)](https://gemnasium.com/futhr/spree_wishlist)
[![Coverage Status](https://coveralls.io/repos/futhr/spree_wishlist/badge.png?branch=master)](https://coveralls.io/r/futhr/spree_wishlist)

The Spree Wishlist extension enables multiple wishlists per user, as well as managing those
as public (sharable) and private. It also includes the ability to notify a friend via email
of a recommended product.

## Installation

1. Add the following to your Gemfile
```ruby
gem 'spree_wishlist', github: 'spree/spree_wishlist'
gem 'spree_email_to_friend', github: 'spree/spree_email_to_friend'
```

2. Run `bundle install`

3. To setup the asset pipeline includes and copy migrations run: `rails g spree_wishlist:install`

## Contributing

* Fork the repo
* Clone your repo
* Run `bundle`
* Run `bundle exec rake test_app` to create the test application in `spec/test_app`
* Make your changes and follow this [Style Guide](https://github.com/thoughtbot/guides)
* Ensure specs pass by running `bundle exec rake`
* Submit your pull request

Copyright (c) 2013 John Dyer, released under the [New BSD License](https://github.com/futhr/spree_wishlist/blob/master/LICENSE)
