class MembershipsController < ApplicationController
  def create
    @group = Group.find(params[:membership][:group_id])
    current_user.join!(@group)
      respond_to do |format|
      format.html { redirect_to @group }
    end
  end

  def destroy
    @group = Membership.find(params[:id]).group
    current_user.leave!(@group)
      respond_to do |format|
      format.html { redirect_to @group }
    end
  end

  def index
    @memberships = Membership.all
  end

end