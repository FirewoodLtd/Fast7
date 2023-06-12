require 'rails_helper'

RSpec.describe "evidences/show", type: :view do
  before(:each) do
    @evidence = assign(:evidence, Evidence.create!(
      :criteria => "Criteria"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Criteria/)
  end
end
