class Membership < ActiveRecord::Base
  attr_accessible :group_id, :user_id
  belongs_to :groups
  belongs_to :users
end
