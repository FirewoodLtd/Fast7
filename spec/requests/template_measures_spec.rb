require 'rails_helper'

RSpec.describe "TemplateMeasures", type: :request do
  describe "GET /template_measures" do
    it "works! (now write some real specs)" do
      get template_measures_path
      expect(response).to have_http_status(200)
    end
  end
end
