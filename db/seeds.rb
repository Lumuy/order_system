# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'factory_bot_rails'

FactoryBot.create(:user, email: 'a@b.com', password: 'password', role: :admin)

10.times do
  user = FactoryBot.create(:user, role: [:admin, :normal].sample)
  rand(20).times do
    FactoryBot.create(:order, status: [:prepare, :processing, :done].sample)
  end
end
