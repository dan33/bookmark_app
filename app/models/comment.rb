# == Schema Information
#
# Table name: comments
#
#  id               :integer          primary key
#  content          :text
#  commentable_id   :integer
#  commentable_type :string(255)
#  created_at       :timestamp        not null
#  updated_at       :timestamp        not null
#  user_id          :integer
#

class Comment < ActiveRecord::Base
  attr_accessible :content
  belongs_to :commentable, polymorphic: true
  belongs_to :user
end
