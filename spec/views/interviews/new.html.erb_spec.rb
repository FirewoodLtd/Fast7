require 'rails_helper'

RSpec.describe "interviews/new", type: :view do
  before(:each) do
    assign(:interview, Interview.new())
  end

  it "renders new interview form" do
    render

    assert_select "form[action=?][method=?]", interviews_path, "post" do
    end
  end
end
