require 'rails_helper'

RSpec.describe "ReviewMeasures", type: :request do
  describe "GET /review_measures" do
    it "works! (now write some real specs)" do
      get review_measures_path
      expect(response).to have_http_status(200)
    end
  end
end
