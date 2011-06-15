require "spec_helper"

describe TenantsController do
  describe "routing" do

    it "routes to #index" do
      get("/tenants").should route_to("tenants#index")
    end

    it "routes to #new" do
      get("/tenants/new").should route_to("tenants#new")
    end

    it "routes to #show" do
      get("/tenants/1").should route_to("tenants#show", :id => "1")
    end

    it "routes to #edit" do
      get("/tenants/1/edit").should route_to("tenants#edit", :id => "1")
    end

    it "routes to #create" do
      post("/tenants").should route_to("tenants#create")
    end

    it "routes to #update" do
      put("/tenants/1").should route_to("tenants#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/tenants/1").should route_to("tenants#destroy", :id => "1")
    end

  end
end
