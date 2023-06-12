require "rails_helper"

RSpec.describe FindingsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/findings").to route_to("findings#index")
    end

    it "routes to #new" do
      expect(:get => "/findings/new").to route_to("findings#new")
    end

    it "routes to #show" do
      expect(:get => "/findings/1").to route_to("findings#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/findings/1/edit").to route_to("findings#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/findings").to route_to("findings#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/findings/1").to route_to("findings#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/findings/1").to route_to("findings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/findings/1").to route_to("findings#destroy", :id => "1")
    end
  end
end
