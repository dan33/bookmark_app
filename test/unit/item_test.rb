# == Schema Information
#
# Table name: items
#
#  id          :integer          primary key
#  title       :string(255)
#  url         :string(255)
#  description :string(255)
#  author      :string(255)
#  created_at  :timestamp        not null
#  updated_at  :timestamp        not null
#  topic_id    :integer
#  slug        :string(255)
#

require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
