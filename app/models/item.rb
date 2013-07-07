# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  url         :string(255)
#  description :string(255)
#  topic_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  slug        :string(255)
#

class Item < ActiveRecord::Base
  attr_accessible :author, :description, :title, :url, :topic_id
  belongs_to :topic
  has_many :comments, as: :commentable

  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :url, :description, :message => "You can't create a link with nothing. "
  validates_length_of :title, :url, :description, :within => 2..450, :too_long => "Geez, are you writing an essay? Write less.", :too_short => "Cmon, you need to write more than that!"
  validates_uniqueness_of :url, :message => "Someone has already added this URL."
end
