class GroupsController < ApplicationController
  def index
  end

  def show
    @group = Group.find(1)
    @topics = Topic.all
    @items = Item.all
    @comments = Comment.all
  end
end