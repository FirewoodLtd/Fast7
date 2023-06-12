require 'rails_helper'

RSpec.describe "measure_document_types/new", type: :view do
  before(:each) do
    assign(:measure_document_type, MeasureDocumentType.new())
  end

  it "renders new measure_document_type form" do
    render

    assert_select "form[action=?][method=?]", measure_document_types_path, "post" do
    end
  end
end
