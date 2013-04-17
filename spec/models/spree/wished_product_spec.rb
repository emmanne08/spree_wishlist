require 'spec_helper'

describe Spree::WishedProduct do
  before do
    @wished_product = Spree::WishedProduct.new
  end

  it "should be valid" do
    @wished_product.should be_valid
  end

  it "should permit mass assigment of variant_id" do
    expect {
      Spree::WishedProduct.new(variant_id: 33506)
    }.not_to raise_error
  end
end
