require 'spec_helper'

describe Spree::User do
  let(:user) { create(:user_with_wishlist) }
  let(:attributes) { attributes_for(:user_with_wishlist) }

  it "has a valid factory" do
    build(:user).should be_valid
  end

  it "create a new instance given a valid attribute" do
    pending "Can't mass-assign protected attributes: authentication_token"
    Spree::User.create! attributes
  end

  context :wishlist do

  end
end
