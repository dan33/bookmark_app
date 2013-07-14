class ItemsController < ApplicationController
  before_filter :check_if_member, :except => [:index, :show]
  before_filter :get_group, :get_user


  def get_group
    @group = Group.find(params[:group_id])
  end

  def get_user
    @user = current_user
  end

  def index
    @items = Item.page(params[:page]).per_page(12).order('created_at DESC')
  end

  def show
    @item = Item.find(params[:id])
    @commentable = @item
    @comments = @commentable.comments
    @comment = Comment.new
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(params[:item])
      if @item.save
        redirect_to [@group, @item]
      else
        render :new
      end
  end

  def update
    @item = Item.find(params[:id])
      if @item.update_attributes(params[:item])
        redirect_to [@group, @item]
      else
        render :edit
      end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
      redirect_to group_items_url
  end

  private
  def check_if_member
    @user = current_user
    @group = Group.find(params[:group_id])
    redirect_to groups_path unless @user.groups.include?(@group)
  end
end
