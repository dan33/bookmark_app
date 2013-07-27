class UsersController < ApplicationController

  def index
    @group = Group.find(params[:group_id])
    @topics = Topic.order('created_at DESC limit 15')
    @items = Item.joins(:topic).order('created_at DESC limit 12')
    @comments = Comment.order('created_at DESC limit 15')
    @users = User.order('created_at DESC limit 15')
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @group = Group.find(params[:group_id])
  end

  def profile
    @groups = current_user.groups.order(:name)
    @user = current_user
  end

end