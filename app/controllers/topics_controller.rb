class TopicsController < ApplicationController
  before_filter :check_if_member, :except => [:index, :show]

  def index
    @topics = Topic.order('created_at DESC limit 15')
    @items = Item.joins(:topic).order('created_at DESC limit 12')
    @comments = Comment.order('created_at DESC limit 15')
    @users = User.order('created_at DESC limit 15')
    @user = current_user
  end

  def show
    @topic = Topic.find(params[:id])
    @user = current_user
  end

  def new
    @topic = Topic.new
    @topic.user = current_user
    @topic.group = Group.find(params[:group_id])
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def create
    @topic = Topic.new(params[:topic])
    @topic.user = current_user
    @topic.group = Group.find(params[:group_id])
      if @topic.save
         redirect_to [@group, @topic]
      else
        render :new
      end
  end

  def update
    @topic = Topic.find(params[:id])
    @user = current_user
      if @topic.update_attributes(params[:topic])
         redirect_to [@group, @topic]
      else
        render :edit
      end
  end

  def destroy
    @topic = Topic.find(params[:id])
    @user = current_user
    @topic.destroy
    redirect_to [@group]
  end

  private
  def check_if_member
    @user = current_user
    @group = Group.find(params[:group_id])
    redirect_to groups_path unless @user.groups.include?(@group)
  end

end

