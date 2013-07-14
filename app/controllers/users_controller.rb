class UsersController < ApplicationController

  def index
    @group = Group.find(params[:group_id])
    @topics = Topic.order('created_at DESC limit 15')
    @items = Item.joins(:topic).order('created_at DESC limit 12')
    @comments = Comment.order('created_at DESC limit 15')
    @users = User.order('created_at DESC limit 15')
    @user = current_user

      respond_to do |format|
        format.html  #show.html.erb
        format.json { render json: @user }
      end
  end

  def show
    @user = User.find(params[:id])
    @group = Group.find(params[:group_id])

      respond_to do |format|
        format.html  #show.html.erb
        format.json { render json: @user }
      end
  end

  def profile
    @groups = current_user.groups.order(:name)
    @user = current_user

  @user.groups.each do |group|
    @topics = group.topics
    @items = group.items
  end

  end

  def new
    @user = User.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @user }
      end
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])

      respond_to do |format|
        if @user.save
          format.html { redirect_to @user, notice: 'User was successfully created.' }
          format.json { render json: @user, status: :created, location: @user }
        else
          format.html { render action: "new" }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
  end

  def update
    @user = User.find(params[:id])

      respond_to do |format|
        if @user.update_attributes(params[:user])
          format.html { redirect_to @user, notice: 'User was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

      respond_to do |format|
        format.html { redirect_to users_url }
        format.json { head :no_content }
      end
  end

end