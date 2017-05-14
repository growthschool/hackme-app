class AdminController < ApplicationController
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  before_action :require_admin!

  layout "admin"

end
