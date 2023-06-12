require 'rails_helper'

RSpec.describe "template_measures/show", type: :view do
  before(:each) do
    @template_measure = assign(:template_measure, TemplateMeasure.create!(
      :weight => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/9.99/)
  end
end
