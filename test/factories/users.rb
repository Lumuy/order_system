FactoryBot.define do
  factory :user do
    email { ('a'..'z').to_a.shuffle[0,8].join + '@gmail.com' }
    password { 'password' }
    role { :admin }
  end
end

