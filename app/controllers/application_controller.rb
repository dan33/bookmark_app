class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  before_filter :get_groups

def get_groups
  @groups = Group.all
end

end
