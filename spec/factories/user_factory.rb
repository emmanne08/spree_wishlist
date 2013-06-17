FactoryGirl.define do
  factory :user_with_wishlist, parent: :user do
    wishlist
  end
end
