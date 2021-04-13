class User < ApplicationRecord
  attr_accessor :password_confirmation

  enum role: [:normal, :admin]

  has_many :orders, dependent: :destroy

  before_save :encrpt_password

  validates_confirmation_of :password_confirmation
  validates :email, allow_nil: true,
                    uniqueness: true,
                    format: { with: /\A[a-z\d\-\_\.]+@[a-z\.]+\.[a-z]+\z/i, on: :create }

  class << self
    def email_select_options(user)
      user.admin? ? pluck(:email) : [user.email]
    end
  end

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrpt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end

