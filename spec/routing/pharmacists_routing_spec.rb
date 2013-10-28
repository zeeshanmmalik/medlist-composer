require "spec_helper"

describe PharmacistsController do
  describe "routing" do

    it "routes to #index" do
      get("/pharmacists").should route_to("pharmacists#index")
    end

    it "routes to #new" do
      get("/pharmacists/new").should route_to("pharmacists#new")
    end

    it "routes to #show" do
      get("/pharmacists/1").should route_to("pharmacists#show", :id => "1")
    end

    it "routes to #edit" do
      get("/pharmacists/1/edit").should route_to("pharmacists#edit", :id => "1")
    end

    it "routes to #create" do
      post("/pharmacists").should route_to("pharmacists#create")
    end

    it "routes to #update" do
      put("/pharmacists/1").should route_to("pharmacists#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/pharmacists/1").should route_to("pharmacists#destroy", :id => "1")
    end

  end
end
