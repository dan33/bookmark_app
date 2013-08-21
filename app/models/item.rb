# == Schema Information
#
# Table name: items
#
#  id          :integer          primary key
#  title       :string(255)
#  url         :string(255)
#  description :string(255)
#  topic_id    :integer
#  created_at  :timestamp        not null
#  updated_at  :timestamp        not null
#  slug        :string(255)
#

class Item < ActiveRecord::Base
  attr_accessible :author, :description, :title, :url, :topic_id
  belongs_to :topic
  has_many :comments, as: :commentable

  before_save :get_meta_info

  extend FriendlyId
  friendly_id :title, use: :slugged

  #validates_presence_of :title, :url, :description, :message => "You can't create a link with nothing. "
  #validates_length_of :title, :url, :description, :within => 2..450, :too_long => "Geez, are you writing an essay? Write less.", :too_short => "Cmon, you need to write more than that!"
  # validates_uniqueness_of :url, :message => "Someone has already added this URL."

  def get_meta_info
    page = MetaInspector.new(self.url, :allow_redirections => :all)
      if page.present? && !self.title && !self.description
        self.title = page.title[0..250]
        self.description = page.description[0..250]
      end
  end

end
