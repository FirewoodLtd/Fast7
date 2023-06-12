require "rails_helper"

RSpec.describe ReviewMeasuresController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/review_measures").to route_to("review_measures#index")
    end

    it "routes to #new" do
      expect(:get => "/review_measures/new").to route_to("review_measures#new")
    end

    it "routes to #show" do
      expect(:get => "/review_measures/1").to route_to("review_measures#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/review_measures/1/edit").to route_to("review_measures#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/review_measures").to route_to("review_measures#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/review_measures/1").to route_to("review_measures#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/review_measures/1").to route_to("review_measures#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/review_measures/1").to route_to("review_measures#destroy", :id => "1")
    end
  end
end
