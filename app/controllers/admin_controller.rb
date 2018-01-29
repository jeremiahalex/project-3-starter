class AdminController < ApplicationController
  before_action :is_admin?
  skip_before_action :verify_authenticity_token
end
