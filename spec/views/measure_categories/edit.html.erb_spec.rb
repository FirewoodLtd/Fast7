require 'rails_helper'

RSpec.describe "categories/edit", type: :view do
  before(:each) do
    @measure_category = assign(:measure_category, Category.create!(
      :name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit measure_category form" do
    render

    assert_select "form[action=?][method=?]", measure_category_path(@measure_category), "post" do

      assert_select "input#measure_category_name[name=?]", "measure_category[name]"

      assert_select "input#measure_category_description[name=?]", "measure_category[description]"
    end
  end
end
