require 'rails_helper'

RSpec.describe "measure_document_types/index", type: :view do
  before(:each) do
    assign(:measure_document_types, [
      MeasureDocumentType.create!(),
      MeasureDocumentType.create!()
    ])
  end

  it "renders a list of measure_document_types" do
    render
  end
end
