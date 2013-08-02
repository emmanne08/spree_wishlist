require 'spec_helper'

feature 'Delete Wishlist' do
  given(:wishlist) { create(:wishlist) }
  given(:user) { wishlist.user }

  background do
    spree_login! user
  end

  scenario 'delete a users wishlist' do
    visit spree.account_path
    click_link wishlist.name
    click_link 'Edit wishlist'
    click_link 'Delete wishlist'
    expect(page).not_to have_content wishlist.name
  end
end
