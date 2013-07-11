module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def is_member?
    @group = Group.find(params[:group_id])
    @group.users.any?{|user| user.id == current_user.id}
  end

end
