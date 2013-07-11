class TopicsController < ApplicationController
  before_filter :check_if_member, :except => [:index, :show]

  def index
    @group = Group.find(params[:group_id])
    @topics = Topic.order('created_at DESC limit 15')
    @items = Item.joins(:topic).order('created_at DESC limit 12')
    @comments = Comment.order('created_at DESC limit 15')
    @users = User.order('created_at DESC limit 15')
    @user = current_user

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @topics }
    end
  end

  def show
    @group = Group.find(params[:group_id])
    @topic = Topic.find_by_slug(params[:id])
    @user = current_user

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @topic }
    end
  end

  def new
    @topic = Topic.new(params[:topic])
    @topic.user = current_user
    @group = Group.find(params[:group_id])
    @topic.group = Group.find(params[:group_id])

    respond_to do |format|
      format.html
      format.json { render json: @topic }
    end
  end

  def edit
    @group = Group.find(params[:group_id])
    @topic = Topic.find(params[:id])
  end

  def create
    @topic = Topic.new(params[:topic])
    @topic.user = current_user
    @group = Group.find(params[:group_id])
    @topic.group = Group.find(params[:group_id])

    respond_to do |format|
      if @topic.save
        format.html { redirect_to group_topics_url }
        format.json { render json: @topic, status: :created, location: @topic }
      else
        format.html { render action: "new" }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @topic = Topic.find(params[:id])
    @group = Group.find(params[:group_id])
    @user = current_user

    respond_to do |format|
      if @topic.update_attributes(params[:topic])
        format.html { redirect_to group_topics_url }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    @group = Group.find(params[:group_id])
    @user = current_user

    respond_to do |format|
      format.html { redirect_to group_topics_url }
      format.json { head :no_content }
    end
  end

  private
  def check_if_member
    @user = current_user
    @group = Group.find(params[:group_id])
    redirect_to groups_path unless @user.groups.include?(@group)
  end

end

