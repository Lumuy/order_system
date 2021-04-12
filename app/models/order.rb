class Order < ApplicationRecord
  enum status: [:prepare, :processing, :done]

  belongs_to :user
end

