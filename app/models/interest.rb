class Interest < ApplicationRecord
  has_many :interest_user_joins
  has_many :users, through: :interest_user_joins

  validates_presence_of :name
end
