class GroupsController < ApplicationController
  before_filter :check_if_member, :only => [:edit, :update, :destroy]

  def index
    @groups = Group.all
    @user = current_user

    @groups.each do |group|
      @topics = group.topics
      @items = group.items
      @topics = @topics
    end
  end

  def show
    @group = Group.find(params[:id])
    @user = current_user
  end

  def new
    @group = Group.new
    @users = @group.users

  end

  def edit
    @group = Group.find_by_slug(params[:id])
  end

  def create
    @group = Group.new(params[:group])

      if @group.save
        redirect_to group_path(@group)
      else
        render :new
      end
  end

  def update
    @user = current_user
    @group = Group.find_by_slug(params[:id])

      if @group.update_attributes(params[:group])
        redirect_to group_path(@group)
      else
        render :edit
      end
  end

  def destroy
    @group = Group.find_by_slug(params[:id])
      if @group.items.empty? && @group.topics.empty?
        @group.destroy
        redirect_to groups_path
      else
        render :edit
      end
  end

  private
  def check_if_member
    @user = current_user
    @group = Group.find_by_slug(params[:id])
    redirect_to groups_path unless @user.groups.include?(@group)
  end
end