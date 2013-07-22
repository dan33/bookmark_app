# == Schema Information
#
# Table name: groups
#
#  id          :integer          primary key
#  name        :string(255)
#  description :string(255)
#  created_at  :timestamp        not null
#  updated_at  :timestamp        not null
#  slug        :string(255)
#

class Group < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :memberships
  has_many :users, :through => :memberships
  has_many :topics
  has_many :items, :through => :topics

  extend FriendlyId
  friendly_id :name, use: :slugged
end
