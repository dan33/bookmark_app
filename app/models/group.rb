class Group < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :users, :through => :memberships
  has_many :topics, :through => :users
  has_many :items, :through => :topics
end
