require "rails_helper"

RSpec.describe ReviewEvidencesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/review_evidences").to route_to("review_evidences#index")
    end

    it "routes to #new" do
      expect(:get => "/review_evidences/new").to route_to("review_evidences#new")
    end

    it "routes to #show" do
      expect(:get => "/review_evidences/1").to route_to("review_evidences#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/review_evidences/1/edit").to route_to("review_evidences#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/review_evidences").to route_to("review_evidences#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/review_evidences/1").to route_to("review_evidences#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/review_evidences/1").to route_to("review_evidences#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/review_evidences/1").to route_to("review_evidences#destroy", :id => "1")
    end
  end
end
