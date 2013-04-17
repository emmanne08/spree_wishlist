# coding: utf-8
version = File.read(File.expand_path('../VERSION', __FILE__)).strip

Gem::Specification.new do |s|
  s.platform     = Gem::Platform::RUBY
  s.name         = 'spree_wishlist'
  s.version      = version
  s.summary      = 'Add wishlists to Spree Commerce'
  s.description  = s.summary
  s.required_ruby_version = '>= 1.9.3'

  s.authors      = 'John Dyer'
  s.email        = 'jdyer@spreecommerce.com'
  s.homepage     = 'https://github.com/spree/spree_wishlist'
  s.license      = 'BSD'

  s.files        = `git ls-files`.split("\n")
  s.test_files   = `git ls-files -- spec/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  spree_version  = '~> 2.0.0.beta'
  s.add_runtime_dependency 'spree_core', spree_version
  s.add_runtime_dependency 'spree_frontend', spree_version
  s.add_runtime_dependency 'spree_api', spree_version

  s.add_development_dependency 'rake', '~> 10.0'
  s.add_development_dependency 'rspec-rails', '~> 2.13'
  s.add_development_dependency 'capybara', '~> 2.1'
  s.add_development_dependency 'factory_girl', '~> 4.2'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'sqlite3', '~> 1.3.7'
  s.add_development_dependency 'simplecov', '~> 0.7.1'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'fuubar', '>= 0.0.1'
  s.add_development_dependency 'i18n-spec', '~> 0.4.0'
end
