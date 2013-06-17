require 'spec_helper'

describe Spree::WishedProduct do
  let(:wished_product) { create(:wished_product) }

  it "is valid" do
    wished_product.should be_valid
  end

  it { should belong_to(:variant) }
  it { should belong_to(:wishlist) }

  it { should allow_mass_assignment_of(:wishlist_id) }
  it { should allow_mass_assignment_of(:variant) }
  it { should allow_mass_assignment_of(:variant_id) }

  it "permit mass assigment of variant_id" do
    expect {
      Spree::WishedProduct.new(variant_id: 33506)
    }.not_to raise_error
  end
end
