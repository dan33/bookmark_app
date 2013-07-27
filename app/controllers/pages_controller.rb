class PagesController < ApplicationController
  skip_before_filter :authenticate_user!
  skip_before_filter :get_group

  def index
  end
end