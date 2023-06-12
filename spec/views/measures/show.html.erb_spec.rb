require 'rails_helper'

RSpec.describe "measures/show", type: :view do
  before(:each) do
    @measure = assign(:measure, Measure.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
