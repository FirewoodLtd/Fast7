require 'rails_helper'

RSpec.describe "MeasureDocumentTypes", type: :request do
  describe "GET /measure_document_types" do
    it "works! (now write some real specs)" do
      get measure_document_types_path
      expect(response).to have_http_status(200)
    end
  end
end
