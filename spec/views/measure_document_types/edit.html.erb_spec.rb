require 'rails_helper'

RSpec.describe "measure_document_types/edit", type: :view do
  before(:each) do
    @measure_document_type = assign(:measure_document_type, MeasureDocumentType.create!())
  end

  it "renders the edit measure_document_type form" do
    render

    assert_select "form[action=?][method=?]", measure_document_type_path(@measure_document_type), "post" do
    end
  end
end
