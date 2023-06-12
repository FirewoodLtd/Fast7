require 'rails_helper'

RSpec.describe "template_measures/index", type: :view do
  before(:each) do
    assign(:template_measures, [
      TemplateMeasure.create!(
        :weight => "9.99"
      ),
      TemplateMeasure.create!(
        :weight => "9.99"
      )
    ])
  end

  it "renders a list of template_measures" do
    render
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
