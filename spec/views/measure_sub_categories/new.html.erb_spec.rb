require 'rails_helper'

RSpec.describe "sub_categories/new", type: :view do
  before(:each) do
    assign(:sub_category, SubCategory.new(
      :name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders new sub_category form" do
    render

    assert_select "form[action=?][method=?]", sub_categories_path, "post" do

      assert_select "input#sub_category_name[name=?]", "sub_category[name]"

      assert_select "input#sub_category_description[name=?]", "sub_category[description]"
    end
  end
end
