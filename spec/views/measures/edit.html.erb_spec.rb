require 'rails_helper'

RSpec.describe "measures/edit", type: :view do
  before(:each) do
    @measure = assign(:measure, Measure.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit measure form" do
    render

    assert_select "form[action=?][method=?]", measure_path(@measure), "post" do

      assert_select "input#measure_name[name=?]", "measure[name]"
    end
  end
end
