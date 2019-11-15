class User < ApplicationRecord
  has_many :memberships
  has_many :topics, :through => :membership
end
