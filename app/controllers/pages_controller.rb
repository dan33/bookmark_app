class PagesController < ApplicationController
  def index
    @topics = Topic.all
    @items = Item.all
  end
end