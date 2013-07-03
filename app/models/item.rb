# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  url         :string(255)
#  description :string(255)
#  author      :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  topic_id    :topic_name
#  slug        :string(255)
#

class Item < ActiveRecord::Base
  attr_accessible :author, :description, :title, :url, :topic_id
  belongs_to :topic
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :url, :description, :message => "You can't create a link with nothing. "
  validates_length_of :title, :url, :description, :within => 10..450, :too_long => "Geez, are you writing an essay? Write less.", :too_short => "Cmon, you need to write more than that!"
  validates_uniqueness_of :url, :message => "Someone has already added this URL."
end
