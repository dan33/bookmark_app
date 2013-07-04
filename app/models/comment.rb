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
#

class Comment < ActiveRecord::Base
  attr_accessible :content
  belongs_to :commentable, polymorphic: true
end
