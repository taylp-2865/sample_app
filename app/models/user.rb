class User < ApplicationRecord
  PROPERTIES = %i(name email password password_confirmation).freeze
  before_save :downcase_email

  validates :name, presence: true,
    length: {maximum: Settings.name_maximun_length}
  validates :email, presence: true,
    length: {maximum: Settings.email_maximun_length},
    format: {with: Settings.email_regex},
    uniqueness: {case_sensitive: false}
  validates :password, presence: true,
    length: {minimum: Settings.password_minimun},
    allow_nil: true, if: :password
  has_secure_password

  class << self
    def User.digest string
      cost = if ActiveModel::SecurePassword.min_cost
               BCrypt::Engine::MIN_COST
             else
               BCrypt::Engine.cost
             end
      BCrypt::Password.create string, cost: cost
    end
  end

  private
  def downcase_email
    email.downcase!
  end
end
