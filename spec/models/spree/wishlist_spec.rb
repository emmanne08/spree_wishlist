require 'spec_helper'

describe Spree::Wishlist do
  let(:user) { create(:user) }
  let(:wishlist) { create(:wishlist, user: user, name: "My Wishlist") }

  it { should belong_to(:user) }
  it { should have_many(:wished_products) }
  it { should validate_presence_of(:name) }

  it { should allow_mass_assignment_of(:name) }
  it { should allow_mass_assignment_of(:is_default) }
  it { should allow_mass_assignment_of(:is_private) }
  it { should allow_mass_assignment_of(:user) }

  ## Untested?
  # def self.get_by_param(param)
  #   Spree::Wishlist.find_by_access_hash(param)
  # end

  ## Untested?
  # def is_default=(value)
  #   self['is_default'] = value
  #   if self.is_default?
  #     Spree::Wishlist.update_all({is_default: false}, ['id != ? AND is_default = ? AND user_id = ?', self.id, true, self.user_id])
  #   end
  # end

  context "can't mass assign ids" do
    it "should not be able to assign variant_id" do
      expect {
        Spree::Wishlist.new(user_id: user.id, name: "My Wishlist")
      }.to raise_error
    end
  end

  context "creating a new wishlist" do
    it "is valid with valid attributes" do
      wishlist.should be_valid
    end

    it "is not valid without a name" do
      wishlist.name = nil
      wishlist.should_not be_valid
    end
  end

  context "#include?" do
    let(:variant) { create(:variant) }

    before do
      wished_product = create(:wished_product, variant: variant)
      wishlist.wished_products << wished_product
      wishlist.save
    end

    it "is true if the wishlist includes the specified variant" do
      wishlist.include?(variant.id).should be_true
    end
  end

  context "#to_param" do
    it "return the wishlist's access_hash" do
      wishlist.to_param.should == wishlist.access_hash
    end
  end

  context "#can_be_read_by?" do
    context "when the wishlist is private" do
      before do
        wishlist.is_private = true
      end

      it "is true when the user owns the wishlist" do
        wishlist.can_be_read_by?(user).should be_true
      end

      it "is false when the user does not own the wishlist" do
        other_user = create(:user)
        wishlist.can_be_read_by?(other_user).should be_false
      end
    end

    context "when the wishlist is public" do
      it "is true for any user" do
        wishlist.is_private = false
        other_user = create(:user)
        wishlist.can_be_read_by?(other_user).should be_true
      end
    end
  end

  context "#is_public?" do
    it "is true when the wishlist is public" do
      wishlist.is_private = false
      wishlist.is_public?.should be_true
    end

    it "is false when the wishlist is private" do
      wishlist.is_private = true
      wishlist.is_public?.should_not be_true
    end
  end
end
