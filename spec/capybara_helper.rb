# From the capybara guide https://github.com/jnicklas/capybara#using-the-dsl-elsewhere

#require 'capybara'
#require 'capybara/dsl'
#require 'spree/testing_support/url_helpers'

module CapybaraHelper
  #include Capybara::DSL

  def capybara_login
    visit spree.login_path
    within "#new_spree_user" do
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
    end
    click_button "Login"
  end
end