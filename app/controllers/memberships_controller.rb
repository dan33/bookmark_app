class MembershipsController < ApplicationController

  def new
    @membership = Membership.new
  end

  def create
    @membership = Membership.new
    @membership.user = current_user
    @group = Group.find(params[:group_id])
    @membership.group = Group.find(params[:group_id])
      if @membership.save
        redirect_to [@group]
      else
        render :new
      end
  end

  def destroy
    @membership.user = current_user
    @group = Group.find(params[:group_id])
    @membership.group = Group.find(params[:group_id])
    @membership.destroy
    redirect_to root_path
  end

end
