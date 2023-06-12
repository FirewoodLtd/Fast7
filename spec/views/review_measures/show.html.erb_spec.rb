require 'rails_helper'

RSpec.describe "review_measures/show", type: :view do
  before(:each) do
    @review_measure = assign(:review_measure, ReviewMeasure.create!(
      :score => "Score"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Score/)
  end
end
