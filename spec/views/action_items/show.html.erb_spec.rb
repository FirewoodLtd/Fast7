require 'rails_helper'

RSpec.describe "action_items/show", type: :view do
  before(:each) do
    @action_item = assign(:action_item, ActionItem.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
