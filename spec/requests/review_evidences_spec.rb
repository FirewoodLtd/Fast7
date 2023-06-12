require 'rails_helper'

RSpec.describe "ReviewEvidences", type: :request do
  describe "GET /review_evidences" do
    it "works! (now write some real specs)" do
      get review_evidences_path
      expect(response).to have_http_status(200)
    end
  end
end
