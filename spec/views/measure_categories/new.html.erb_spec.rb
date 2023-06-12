require 'rails_helper'

RSpec.describe "categories/new", type: :view do
  before(:each) do
    assign(:measure_category, Category.new(
      :name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders new measure_category form" do
    render

    assert_select "form[action=?][method=?]", categories_path, "post" do

      assert_select "input#measure_category_name[name=?]", "measure_category[name]"

      assert_select "input#measure_category_description[name=?]", "measure_category[description]"
    end
  end
end
