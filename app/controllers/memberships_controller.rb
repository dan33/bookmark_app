class MembershipsController < ApplicationController

  def new
    @membership = Membership.new

    respond_to do |format|
      format.html
      format.json { render json: @membership }
    end
  end

  def edit
    @membership = Membership.find(params[:id])
  end

  def create
    @membership = Membership.new(params[:membership])
    @user = current_user

    respond_to do |format|
      if @membership.save
        format.html { redirect_to items_url }
        format.json { render json: @membership, status: :created, location: @membership }
      else
        format.html { render action: "new" }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @membership = Membership.find(params[:id])

    respond_to do |format|
      if @membership.update_attributes(params[:membership])
        format.html { redirect_to memberships_url }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @membership = Membership.find(params[:id])
    @membership.destroy

    respond_to do |format|
      format.html { redirect_to memberships_url }
      format.json { head :no_content }
    end
  end
end
