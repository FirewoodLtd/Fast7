require 'rails_helper'

RSpec.describe "review_measures/new", type: :view do
  before(:each) do
    assign(:review_measure, ReviewMeasure.new(
      :score => "MyString"
    ))
  end

  it "renders new review_measure form" do
    render

    assert_select "form[action=?][method=?]", review_measures_path, "post" do

      assert_select "input#review_measure_score[name=?]", "review_measure[score]"
    end
  end
end
