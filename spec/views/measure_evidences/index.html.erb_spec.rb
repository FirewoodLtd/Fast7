require 'rails_helper'

RSpec.describe "evidences/index", type: :view do
  before(:each) do
    assign(:evidences, [
      Evidence.create!(
        :criteria => "Criteria"
      ),
      Evidence.create!(
        :criteria => "Criteria"
      )
    ])
  end

  it "renders a list of evidences" do
    render
    assert_select "tr>td", :text => "Criteria".to_s, :count => 2
  end
end
