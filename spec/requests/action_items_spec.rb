require 'rails_helper'

RSpec.describe "ActionItems", type: :request do
  describe "GET /action_items" do
    it "works! (now write some real specs)" do
      get action_items_path
      expect(response).to have_http_status(200)
    end
  end
end
