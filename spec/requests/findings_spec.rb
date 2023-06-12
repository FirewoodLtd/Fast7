require 'rails_helper'

RSpec.describe "Findings", type: :request do
  describe "GET /findings" do
    it "works! (now write some real specs)" do
      get findings_path
      expect(response).to have_http_status(200)
    end
  end
end
