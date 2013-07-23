require 'spec_helper'

feature "Delete Wishlist", js: true do
  let(:wishlist){ create(:wishlist) }
  let(:user){ wishlist.user }

  scenario "delete a user's wishlist" do
    visit '/login'
    within('#new_spree_user') do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
    end
    click_button 'Login'

    visit '/account'
    click_link "#{wishlist.name}"
    click_link 'Edit wishlist'
    click_link 'Delete wishlist'
    page.driver.accept_js_confirms!
    expect(page).not_to have_content("#{wishlist.name}")
  end
end
