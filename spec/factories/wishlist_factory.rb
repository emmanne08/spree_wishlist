FactoryGirl.define do
  factory :wishlist, class: Spree::Wishlist do
    user
    sequence(:name) { |n| "name{n}" }
    is_private true
    is_default false
  end
end
