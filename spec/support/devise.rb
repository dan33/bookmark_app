RSpec.configure do |config|
  config.include Devise::TestHelpers, :type => :controller
  @request.env["devise.mapping"] = Devise.mappings[:user]
get :new
end