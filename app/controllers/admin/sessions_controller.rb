class Admin::SessionsController < Devise::SessionsController
  ssl_exceptions
  before_filter :authenticate_admin!
  
end
