class ConfirmationController < ApplicationController
  
  def show
    @registrant = Registrant.new(params[:registrant])
    
  end
end
