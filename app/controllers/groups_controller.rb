class GroupsController < ApplicationController
  def index
  end

  def show
    @group = Group.find(params[:id])
    @topics = Topic.all
    @items = Item.all
  end
end