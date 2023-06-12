require 'rails_helper'

RSpec.describe "findings/new", type: :view do
  before(:each) do
    assign(:finding, Finding.new())
  end

  it "renders new finding form" do
    render

    assert_select "form[action=?][method=?]", findings_path, "post" do
    end
  end
end
