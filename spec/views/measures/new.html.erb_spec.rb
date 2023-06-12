require 'rails_helper'

RSpec.describe "measures/new", type: :view do
  before(:each) do
    assign(:measure, Measure.new(
      :name => "MyString"
    ))
  end

  it "renders new measure form" do
    render

    assert_select "form[action=?][method=?]", measures_path, "post" do

      assert_select "input#measure_name[name=?]", "measure[name]"
    end
  end
end
