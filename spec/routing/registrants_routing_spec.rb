require "spec_helper"

describe RegistrantsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/registrants" }.should route_to(:controller => "registrants", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/registrants/new" }.should route_to(:controller => "registrants", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/registrants/1" }.should route_to(:controller => "registrants", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/registrants/1/edit" }.should route_to(:controller => "registrants", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/registrants" }.should route_to(:controller => "registrants", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/registrants/1" }.should route_to(:controller => "registrants", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/registrants/1" }.should route_to(:controller => "registrants", :action => "destroy", :id => "1")
    end

  end
end
