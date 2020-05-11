class User < ApplicationRecord
  has_many :microposts, dependent: :destroy #I prob want to get rid of this second argument later
  has_one :address
  accepts_nested_attributes_for :address
  has_many :tasks
  accepts_nested_attributes_for :tasks,
                                allow_destroy: true,
                                reject_if: :all_blank
  has_many :interest_user_joins
  has_many :interests, through: :interest_user_joins
  accepts_nested_attributes_for :interest_user_joins,
                                allow_destroy: true
  accepts_nested_attributes_for :interests

      before_save { email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
   validates :email, presence: true, length: { maximum: 255 },
                           format: { with: VALID_EMAIL_REGEX },
                           uniqueness: true
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true

   # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
