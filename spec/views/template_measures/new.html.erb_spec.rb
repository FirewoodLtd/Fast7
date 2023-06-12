require 'rails_helper'

RSpec.describe "template_measures/new", type: :view do
  before(:each) do
    assign(:template_measure, TemplateMeasure.new(
      :weight => "9.99"
    ))
  end

  it "renders new template_measure form" do
    render

    assert_select "form[action=?][method=?]", template_measures_path, "post" do

      assert_select "input#template_measure_weight[name=?]", "template_measure[weight]"
    end
  end
end
