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

class Membership < ActiveRecord::Base
  attr_accessible :user_id, :group_id
  belongs_to :group
  belongs_to :user
end
