require "rails_helper"

RSpec.describe TemplateMeasuresController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/template_measures").to route_to("template_measures#index")
    end

    it "routes to #new" do
      expect(:get => "/template_measures/new").to route_to("template_measures#new")
    end

    it "routes to #show" do
      expect(:get => "/template_measures/1").to route_to("template_measures#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/template_measures/1/edit").to route_to("template_measures#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/template_measures").to route_to("template_measures#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/template_measures/1").to route_to("template_measures#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/template_measures/1").to route_to("template_measures#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/template_measures/1").to route_to("template_measures#destroy", :id => "1")
    end
  end
end
