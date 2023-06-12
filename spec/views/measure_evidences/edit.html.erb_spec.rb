require 'rails_helper'

RSpec.describe "evidences/edit", type: :view do
  before(:each) do
    @evidence = assign(:evidence, Evidence.create!(
      :criteria => "MyString"
    ))
  end

  it "renders the edit evidence form" do
    render

    assert_select "form[action=?][method=?]", evidence_path(@evidence), "post" do

      assert_select "input#evidence_criteria[name=?]", "evidence[criteria]"
    end
  end
end
