# == Schema Information
#
# Table name: topics
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  slug        :string(255)
#

class Topic < ActiveRecord::Base
  attr_accessible :user_id, :description, :name
  has_many :items
  belongs_to :user

  extend FriendlyId
  friendly_id :name, use: :slugged

  validates_presence_of :name, :description, :message => "You can't create a topic with nothing. "
  validates_length_of :name, :description, :within => 2..450, :too_long => "Geez, are you writing an essay? Write less.", :too_short => "Cmon, you need to write more than that!"
  validates_uniqueness_of :name, :message => "This topic already exists."
end
