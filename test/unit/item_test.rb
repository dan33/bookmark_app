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

require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
