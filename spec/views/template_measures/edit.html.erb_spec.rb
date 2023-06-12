require 'rails_helper'

RSpec.describe "template_measures/edit", type: :view do
  before(:each) do
    @template_measure = assign(:template_measure, TemplateMeasure.create!(
      :weight => "9.99"
    ))
  end

  it "renders the edit template_measure form" do
    render

    assert_select "form[action=?][method=?]", template_measure_path(@template_measure), "post" do

      assert_select "input#template_measure_weight[name=?]", "template_measure[weight]"
    end
  end
end
