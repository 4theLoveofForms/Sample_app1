class Topic < ApplicationRecord
  has_many :memberships
  has_many :users, :through => :membership
end
