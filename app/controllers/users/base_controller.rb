class Users::BaseController < ApplicationController
  before_action :require_current_user

  def require_current_user
    render file: "/public/404" unless current_user
  end
end
