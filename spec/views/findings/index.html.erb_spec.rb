require 'rails_helper'

RSpec.describe "findings/index", type: :view do
  before(:each) do
    assign(:findings, [
      Finding.create!(),
      Finding.create!()
    ])
  end

  it "renders a list of findings" do
    render
  end
end
