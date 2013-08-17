class UsersController < ApplicationController
  skip_before_filter :get_group, :only => [:profile]

  def index
    @topics = Topic.order('created_at DESC limit 15')
    @items = Item.joins(:topic).order('created_at DESC limit 12')
    @comments = Comment.order('created_at DESC limit 15')
    @users = User.order('created_at DESC limit 15')
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
  end

  def profile
    @user = current_user
    render :layout => 'groups_index'
  end

end