require 'spec_helper'

feature 'Create Wishlist' do
  given!(:user) { create(:user) }

  background do
    spree_login! user
  end

  # user uses a product's 'Add to wishlist' button to create a new wishlist
  scenario 'when user has no existing wishlist' do
    product = create(:product)
    visit spree.product_path(product)
    click_button 'Add to wishlist'
    expect(page).to have_content user.wishlists.first.name
  end

  # user has no knowledge of the new wishlist path
  scenario 'when user has an existing wishlist' do
    wishlist = create(:wishlist, user: user)
    visit spree.account_path
    click_link wishlist.name
    click_link 'Create new wishlist'
    fill_in 'Name', with: 'A New Wishlist Name'
    click_button 'Create'
    expect(page).to have_content 'A New Wishlist Name'
  end

  # user has knowledge of the new wishlist path
  scenario 'when user makes use of the new wishlist path' do
    visit spree.new_wishlist_path
    fill_in 'Name', with: 'A New Wishlist Name'
    click_button 'Create'
    expect(page).to have_content 'A New Wishlist Name'
  end
end
