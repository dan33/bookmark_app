# == Schema Information
#
# Table name: topics
#
#  id          :integer          primary key
#  name        :string(255)
#  description :string(255)
#  user_id     :integer
#  created_at  :timestamp        not null
#  updated_at  :timestamp        not null
#  slug        :string(255)
#  group_id    :integer
#

require 'test_helper'

class TopicTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
