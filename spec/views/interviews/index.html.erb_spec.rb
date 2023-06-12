require 'rails_helper'

RSpec.describe "interviews/index", type: :view do
  before(:each) do
    assign(:interviews, [
      Interview.create!(),
      Interview.create!()
    ])
  end

  it "renders a list of interviews" do
    render
  end
end
