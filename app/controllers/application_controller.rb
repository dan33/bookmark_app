class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  before_filter :get_group
  before_filter :item_new

def get_group
  @group = Group.find(params[:group_id])
end

def item_new
  @item_new = Item.new
end

end
