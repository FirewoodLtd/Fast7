require 'rails_helper'

RSpec.describe "scores/index", type: :view do
  before(:each) do
    assign(:scores, [
      Score.create!(
        :name => "Name",
        :min => 2,
        :max => "",
        :color => "Color"
      ),
      Score.create!(
        :name => "Name",
        :min => 2,
        :max => "",
        :color => "Color"
      )
    ])
  end

  it "renders a list of scores" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Color".to_s, :count => 2
  end
end
