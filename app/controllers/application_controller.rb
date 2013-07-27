class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  before_filter :get_group

def get_group
  @group = Group.find(params[:group_id])
end

end
