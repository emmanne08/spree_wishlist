require 'spec_helper'

feature "Wish Product from Cart", js: true do
  stub_authorization!

  pending "add to wishlist" do
    scenario "add the selected variant to the wishlist" do
      prod = create(:product)
      variant1 = create(:variant)
      variant2 = create(:variant)
      variant1.product = prod
      variant1.save
      variant2.product = prod
      variant2.save

      visit "/products/#{prod.permalink}"

      find("#products_#{prod.master.id}_#{variant2.id}").click
      click_button "Add to wishlist"
      r = page.evaluate_script("$('#variants_#{variant2.id}').val();")
      r.to_i.should == 1
    end
  end
end
