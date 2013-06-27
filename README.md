# Spree Wishlist

[![Build Status](https://travis-ci.org/futhr/spree_wishlist.png)](https://travis-ci.org/futhr/spree_wishlist)
[![Dependency Status](https://gemnasium.com/futhr/spree_wishlist.png)](https://gemnasium.com/futhr/spree_wishlist)
[![Coverage Status](https://coveralls.io/repos/futhr/spree_wishlist/badge.png?branch=master)](https://coveralls.io/r/futhr/spree_wishlist)

The Spree Wishlist extension enables multiple wishlists per user, as well as managing those as public (sharable) and private. It also includes the ability to notify a friend via email of a recommended product.

## Installation

1. Add the following to your Gemfile
```ruby
gem 'spree_wishlist', github: 'spree/spree_wishlist'
gem 'spree_email_to_friend', github: 'spree/spree_email_to_friend'
```

2. Run
```sh
bundle install
bundle exec rails g spree_wishlist:install
```

## Contributing

In the spirit of [free software][1], **everyone** is encouraged to help improve this project.

Here are some ways *you* can contribute:

* by using prerelease versions
* by reporting [bugs][2]
* by suggesting new features
* by writing or editing documentation
* by writing specifications
* by writing code (*no patch is too small*: fix typos, add comments, clean up inconsistent whitespace)
* by refactoring code
* by resolving [issues][2]
* by reviewing patches

Starting point:

* Fork the repo
* Clone your repo
* Run `bundle`
* Run `bundle exec rake test_app` to create the test application in `spec/test_app`
* Make your changes
* Ensure specs pass by running `bundle exec rspec spec`
* Submit your pull request

Copyright (c) 2013 John Dyer, released under the [New BSD License][3]

[1]: http://www.fsf.org/licensing/essays/free-sw.html
[2]: https://github.com/futhr/spree_wishlist/issues
[3]: https://github.com/futhr/spree_wishlist/tree/master/LICENSE
