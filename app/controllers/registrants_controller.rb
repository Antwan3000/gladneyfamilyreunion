class RegistrantsController < ApplicationController
  ssl_exceptions
  
  # GET /registrants
  # GET /registrants.xml
  def index
    @registrants = Registrant.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @registrants }
    end
  end

  # GET /registrants/1
  # GET /registrants/1.xml
  def show
    @registrant = Registrant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @registrant }
    end
  end

  # GET /registrants/new
  # GET /registrants/new.xml
  def new
    @registrant = Registrant.new
    @registrant.build_address
    #@registrant.guests.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @registrant }
    end
  end

  # GET /registrants/1/edit
  def edit
    @registrant = Registrant.find_by_confirmation_num(params[:conf_num])
  end

  # POST /registrants
  # POST /registrants.xml
  def create
    @registrant = Registrant.new(params[:registrant])
    
    if @registrant.already_confirmed?
      @registrant.save
      num_guests = @registrant.guests.count
      redirect_to confirm_registration_path(@registrant), :notice => "You have successfully registered. Confirmation Number is: #{@registrant.confirmation_num}"
    else
      if @registrant.valid?
        @registrant.init_confirmation!
        render 'confirm', :location => '/confirm'
      else
        render :action => 'new'
      end
    end
  end
  
  def confirmation
    @registrant = Registrant.find(params[:id])
    render :action => 'show'
  end
  
  # POST /registrants
  # POST /registrants.xml
  # def create
  #   @registrant = Registrant.new(params[:registrant])
  # 
  #   respond_to do |format|
  #     if @registrant.save
  #       format.html { redirect_to(@registrant, :notice => 'Registrant was successfully created.') }
  #       format.xml  { render :xml => @registrant, :status => :created, :location => @registrant }
  #     else
  #       format.html { render :action => "new"}
  #       format.xml  { render :xml => @registrant.errors, :status => :unprocessable_entity }
  #     end
  #   end
  # end
  

  # PUT /registrants/1
  # PUT /registrants/1.xml
  def update
    @registrant = Registrant.find_by_confirmation_num(params[:conf_num])

    respond_to do |format|
      if @registrant.update_attributes(params[:registrant])
        format.html { render 'show', :notice => 'Your registration was successfully updated.' }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @registrant.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def cancel_edit
    redirect_to root_url
  end

  # DELETE /registrants/1
  # DELETE /registrants/1.xml
  def destroy
    @registrant = Registrant.find(params[:id])
    @registrant.destroy

    respond_to do |format|
      format.html { redirect_to(registrants_url) }
      format.xml  { head :ok }
    end
  end
  
  def validate
     @registrant = Registrant.find_by_email_and_confirmation_num(params[:val][:email], params[:val][:confirmation_num])
     
     unless @registrant.nil?
       redirect_to edit_registration_path(@registrant.confirmation_num)
    else
      flash[:error] = 'Sorry.  Unable to validate.'
      render 'credentials'
    end
  end
  
end
