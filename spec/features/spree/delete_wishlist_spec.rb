require 'spec_helper'

feature "Delete Wishlist" do
  given(:wishlist) { create(:wishlist) }
  given(:user) { wishlist.user }

  scenario "delete a user's wishlist" do
    capybara_login

    visit spree.account_path
    click_link "#{wishlist.name}"
    click_link "Edit wishlist"
    click_link "Delete wishlist"
    expect(page).not_to have_content("#{wishlist.name}")
  end
end
