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

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
