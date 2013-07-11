class CommentsController < ApplicationController
  before_filter :load_commentable

  def index
    @comments = @commentable.comments
  end

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new(params[:comment])
    @comment.user = current_user
    if @comment.save
      redirect_to group_items_path, notice: "Comment created."
    else
      render :new
    end
  end

private

  def load_commentable
    resource, id = request.path.split('/')[3, 3]
    @commentable = resource.singularize.classify.constantize.find(id)
  end
end