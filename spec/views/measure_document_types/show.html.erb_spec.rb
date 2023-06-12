require 'rails_helper'

RSpec.describe "measure_document_types/show", type: :view do
  before(:each) do
    @measure_document_type = assign(:measure_document_type, MeasureDocumentType.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
