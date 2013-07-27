class MembershipsController < ApplicationController

  def new
    @membership = Membership.new
  end

  def create
    @membership = Membership.new
    @membership.user = current_user
    @membership.group = Group.find(params[:group_id])
      if @membership.save
        redirect_to [@group]
      else
        render :new
      end
  end

  def destroy
    @membership = Membership.find(params[:id])
    @membership.user = current_user
    @membership.group = @group
    @membership.destroy
    redirect_to [@group]
  end

end
