class Spree::WishedProduct < ActiveRecord::Base
  belongs_to :variant, class_name: 'Spree::Variant'
  belongs_to :wishlist, class_name: 'Spree::Wishlist'

  attr_accessible :wishlist_id, :variant, :variant_id, :remark
end
