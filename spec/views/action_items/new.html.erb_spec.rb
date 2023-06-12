require 'rails_helper'

RSpec.describe "action_items/new", type: :view do
  before(:each) do
    assign(:action_item, ActionItem.new())
  end

  it "renders new action_item form" do
    render

    assert_select "form[action=?][method=?]", action_items_path, "post" do
    end
  end
end
