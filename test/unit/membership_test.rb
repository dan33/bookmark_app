# == Schema Information
#
# Table name: memberships
#
#  id         :integer          primary key
#  user_id    :integer
#  group_id   :integer
#  created_at :timestamp        not null
#  updated_at :timestamp        not null
#

require 'test_helper'

class MembershipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
