require 'rails_helper'

RSpec.describe "evidences/new", type: :view do
  before(:each) do
    assign(:evidence, Evidence.new(
      :criteria => "MyString"
    ))
  end

  it "renders new evidence form" do
    render

    assert_select "form[action=?][method=?]", evidences_path, "post" do

      assert_select "input#evidence_criteria[name=?]", "evidence[criteria]"
    end
  end
end
