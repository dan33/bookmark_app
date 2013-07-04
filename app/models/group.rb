# == Schema Information
#
# Table name: groups
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Group < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :memberships
  has_many :users, :through => :memberships
  has_many :topics, :through => :users
  has_many :items, :through => :topics
end
