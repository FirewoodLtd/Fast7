require 'rails_helper'

RSpec.describe "review_measures/index", type: :view do
  before(:each) do
    assign(:review_measures, [
      ReviewMeasure.create!(
        :score => "Score"
      ),
      ReviewMeasure.create!(
        :score => "Score"
      )
    ])
  end

  it "renders a list of review_measures" do
    render
    assert_select "tr>td", :text => "Score".to_s, :count => 2
  end
end
