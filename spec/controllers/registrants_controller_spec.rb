require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by the Rails when you ran the scaffold generator.

describe RegistrantsController do

  def mock_registrant(stubs={})
    @mock_registrant ||= mock_model(Registrant, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all registrants as @registrants" do
      Registrant.stub(:all) { [mock_registrant] }
      get :index
      assigns(:registrants).should eq([mock_registrant])
    end
  end

  describe "GET show" do
    it "assigns the requested registrant as @registrant" do
      Registrant.stub(:find).with("37") { mock_registrant }
      get :show, :id => "37"
      assigns(:registrant).should be(mock_registrant)
    end
  end

  describe "GET new" do
    it "assigns a new registrant as @registrant" do
      Registrant.stub(:new) { mock_registrant }
      get :new
      assigns(:registrant).should be(mock_registrant)
    end
  end

  describe "GET edit" do
    it "assigns the requested registrant as @registrant" do
      Registrant.stub(:find).with("37") { mock_registrant }
      get :edit, :id => "37"
      assigns(:registrant).should be(mock_registrant)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created registrant as @registrant" do
        Registrant.stub(:new).with({'these' => 'params'}) { mock_registrant(:save => true) }
        post :create, :registrant => {'these' => 'params'}
        assigns(:registrant).should be(mock_registrant)
      end

      it "redirects to the created registrant" do
        Registrant.stub(:new) { mock_registrant(:save => true) }
        post :create, :registrant => {}
        response.should redirect_to(registrant_url(mock_registrant))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved registrant as @registrant" do
        Registrant.stub(:new).with({'these' => 'params'}) { mock_registrant(:save => false) }
        post :create, :registrant => {'these' => 'params'}
        assigns(:registrant).should be(mock_registrant)
      end

      it "re-renders the 'new' template" do
        Registrant.stub(:new) { mock_registrant(:save => false) }
        post :create, :registrant => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested registrant" do
        Registrant.stub(:find).with("37") { mock_registrant }
        mock_registrant.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :registrant => {'these' => 'params'}
      end

      it "assigns the requested registrant as @registrant" do
        Registrant.stub(:find) { mock_registrant(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:registrant).should be(mock_registrant)
      end

      it "redirects to the registrant" do
        Registrant.stub(:find) { mock_registrant(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(registrant_url(mock_registrant))
      end
    end

    describe "with invalid params" do
      it "assigns the registrant as @registrant" do
        Registrant.stub(:find) { mock_registrant(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:registrant).should be(mock_registrant)
      end

      it "re-renders the 'edit' template" do
        Registrant.stub(:find) { mock_registrant(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested registrant" do
      Registrant.stub(:find).with("37") { mock_registrant }
      mock_registrant.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the registrants list" do
      Registrant.stub(:find) { mock_registrant }
      delete :destroy, :id => "1"
      response.should redirect_to(registrants_url)
    end
  end

end
