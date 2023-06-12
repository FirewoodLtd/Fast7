require 'rails_helper'

RSpec.describe "sub_categories/index", type: :view do
  before(:each) do
    assign(:sub_categories, [
      SubCategory.create!(),
      SubCategory.create!()
    ])
  end

  it "renders a list of sub_categories" do
    render
  end
end
