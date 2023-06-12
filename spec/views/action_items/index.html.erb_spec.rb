require 'rails_helper'

RSpec.describe "action_items/index", type: :view do
  before(:each) do
    assign(:action_items, [
      ActionItem.create!(),
      ActionItem.create!()
    ])
  end

  it "renders a list of action_items" do
    render
  end
end
