# == Schema Information
#
# Table name: groups
#
#  id          :integer          primary key
#  name        :string(255)
#  description :string(255)
#  created_at  :timestamp        not null
#  updated_at  :timestamp        not null
#  slug        :string(255)
#

require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
