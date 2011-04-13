class Admin::RegistrationsController < ApplicationController
  ssl_exceptions
  before_filter :authenticate_admin!
  
  # GET /registrants
  # GET /registrants.xml
  def index
    @registrants = Registrant.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @registrants }
    end
  end

  # GET /registrants/1/edit
  def edit
    @registrant = Registrant.find(params[:id])
  end

  # PUT /registrants/1
  # PUT /registrants/1.xml
  def update
    @registrant = Registrant.find(params[:id])

    respond_to do |format|
      if @registrant.update_attributes(params[:registrant])
        format.html { redirect_to(@registrant, :notice => 'Registrant was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @registrant.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /registrants/1
  # DELETE /registrants/1.xml
  def destroy
    @registrant = Registrant.find(params[:id])
    @registrant.destroy

    respond_to do |format|
      format.html { redirect_to(admin_registrants_url) }
      format.xml  { head :ok }
    end
  end

end
