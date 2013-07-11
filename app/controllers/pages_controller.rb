class PagesController < ApplicationController
  skip_before_filter :authenticate_user!
  def index
    @topics = Topic.order('created_at DESC limit 10')
    @topic = Topic.new(params[:topic])
    @items = Item.order('created_at DESC limit 10')
    @item = Item.new(params[:item])
    @commentable = @item
    @comments = @commentable.comments
  end
end