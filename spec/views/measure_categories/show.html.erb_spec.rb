require 'rails_helper'

RSpec.describe "categories/show", type: :view do
  before(:each) do
    @measure_category = assign(:measure_category, Category.create!(
      :name => "Name",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
  end
end
