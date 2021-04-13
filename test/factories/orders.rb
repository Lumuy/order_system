FactoryBot.define do
  factory :order do
    association :user, factory: :user
    amount { SecureRandom.rand }
    status { :done }
  end
end
