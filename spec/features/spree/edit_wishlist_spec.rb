require 'spec_helper'

feature "Edit Wishlist" do
  given(:wishlist) { create(:wishlist) }
  given(:user) { wishlist.user }

  background do
    visit "/login"
    within "#new_spree_user" do
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
    end
    click_button "Login"
  end

  scenario "edit a wishlist's name" do
    visit "/account"
    click_link "#{wishlist.name}"
    click_link "Edit wishlist"
    fill_in "Name", with: "A New Wishlist Name"
    click_button "Update"
    expect(page).to have_content("A New Wishlist Name")
  end

  context "edit a wishlist's is_private" do
    scenario "set wishlist from private to public" do
      wishlist.is_private = true
      wishlist.save
      # wishlist.update(is_private: true) throws up a NoMethodError
      visit "/account"
      click_link "#{wishlist.name}"
      click_link "Edit wishlist"
      uncheck "is private"
      click_button "Update"
      expect(page).to have_checked_field("wishlist_is_private_false")
    end

    scenario "set wishlist from public to private" do
      wishlist.is_private = false
      wishlist.save
      visit "/account"
      click_link "#{wishlist.name}"
      click_link "Edit wishlist"
      check "is private"
      click_button "Update"
      expect(page).to have_checked_field("wishlist_is_private_true")
    end
  end

  context "edit a wishlist's is_default" do
    scenario "set wishlist from default to non-default" do
      wishlist.is_default = true
      wishlist.save
      visit "/account"
      click_link "#{wishlist.name}"
      click_link "Edit wishlist"
      uncheck "is default"
      click_button "Update"
      click_link "Edit wishlist"
      expect(page).to have_unchecked_field("is default")
    end

    scenario "set wishlist from non-default to default" do
      wishlist.is_default = false
      wishlist.save
      visit "/account"
      click_link "#{wishlist.name}"
      click_link "Edit wishlist"
      check "is default"
      click_button "Update"
      click_link "Edit wishlist"
      expect(page).to have_checked_field("is default")
    end
  end
end
