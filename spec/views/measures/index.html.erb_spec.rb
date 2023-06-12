require 'rails_helper'

RSpec.describe "measures/index", type: :view do
  before(:each) do
    assign(:measures, [
      Measure.create!(
        :name => "Name"
      ),
      Measure.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of measures" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
