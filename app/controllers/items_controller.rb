class ItemsController < ApplicationController
  before_filter :check_if_member, :except => [:index, :show]

  def index
    @items = Item.page(params[:page]).per_page(12).order('created_at DESC')
    @group = Group.find(params[:group_id])
    @user = current_user

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end

  def show
    @group = Group.find(params[:group_id])
    @item = Item.find(params[:id])
    @commentable = @item
    @comments = @commentable.comments
    @comment = Comment.new
    @user = current_user

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  def new
    @item = Item.new
    @group = Group.find(params[:group_id])
    @user = current_user

    respond_to do |format|
      format.html
      format.json { render json: @item }
    end
  end

  def edit
    @item = Item.find(params[:id])
    @group = Group.find(params[:group_id])
    @user = current_user
  end

  def create
    @item = Item.new(params[:item])
    @group = Group.find(params[:group_id])
    @user = current_user

    respond_to do |format|
      if @item.save
        format.html { redirect_to group_items_url }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @item = Item.find(params[:id])
    @user = current_user

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to group_items_url }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to group_items_url }
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
