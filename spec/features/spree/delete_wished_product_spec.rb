require 'spec_helper'

feature 'Delete Wished Product' do
  given(:user) { create(:user) }
  given(:wishlist) { create(:wishlist, user: user)}

  background do
    spree_login! user
  end

  scenario 'from a wishlist with one wished product' do
    wished_product = create(:wished_product, wishlist: wishlist)
    visit spree.wishlist_path(wishlist)
    wp_path = spree.wished_product_path(wished_product)
    delete_links = find(:xpath, "//table[@id='wishlist']/tbody").all(:xpath, './/tr/td/p/a')
    delete_link = delete_links.select { |link| link[:href] == wp_path }.first
    delete_link.click
    expect(page).not_to have_content(wished_product.variant.product.name)
  end

  scenario 'randomly from a wishlist with multiple wished products while maintaining ordering by date added' do
    wished_products = [
      create(:wished_product, wishlist: wishlist),
      create(:wished_product, wishlist: wishlist),
      create(:wished_product, wishlist: wishlist)
    ]
    wished_product = wished_products.delete_at(Random.rand(wished_products.length))
    visit spree.wishlist_path(wishlist)
    wp_path = spree.wished_product_path(wished_product)
    delete_links = find(:xpath, "//table[@id='wishlist']/tbody").all(:xpath, './/tr/td/p/a')
    delete_link = delete_links.select { |link| link[:href] == wp_path }.first
    delete_link.click
    pattern = Regexp.new(wished_products.map { |wp| wp.variant.product.name }.join('.*'))
    expect(page).not_to have_content(wished_product.variant.product.name)
    expect(page).to have_content(pattern)
  end
end
