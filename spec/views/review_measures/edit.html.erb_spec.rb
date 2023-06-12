require 'rails_helper'

RSpec.describe "review_measures/edit", type: :view do
  before(:each) do
    @review_measure = assign(:review_measure, ReviewMeasure.create!(
      :score => "MyString"
    ))
  end

  it "renders the edit review_measure form" do
    render

    assert_select "form[action=?][method=?]", review_measure_path(@review_measure), "post" do

      assert_select "input#review_measure_score[name=?]", "review_measure[score]"
    end
  end
end
