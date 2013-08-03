require 'spec_helper'

feature 'Add Wished Product' do
  given(:user) { create(:user) }
  given(:product) { create(:product) }

  background do
    spree_login! user
  end

  scenario 'when user has a default wishlist' do
    wishlist = create(:wishlist, is_default: true, user: user)
    visit spree.product_path(product)
    click_button 'Add to wishlist'
    expect(page).to have_content(wishlist.name)
    expect(page).to have_content(product.name)
  end

  scenario 'when user has no default but with non-default wishlist' do
    wishlist = create(:wishlist, is_default: false, user: user)
    visit spree.product_path(product)
    click_button 'Add to wishlist'
    wishlist.reload.is_default.should be_true
    expect(page).to have_content(wishlist.name)
    expect(page).to have_content(product.name)
  end

  scenario 'when user has no wishlist at all' do
    user.wishlists.should be_empty
    visit spree.product_path(product)
    click_button 'Add to wishlist'
    user.wishlists.reload.count.should eq(1)
    expect(page).to have_content(user.wishlists.first.name)
    expect(page).to have_content(product.name)
  end
end
