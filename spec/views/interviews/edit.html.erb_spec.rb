require 'rails_helper'

RSpec.describe "interviews/edit", type: :view do
  before(:each) do
    @interview = assign(:interview, Interview.create!())
  end

  it "renders the edit interview form" do
    render

    assert_select "form[action=?][method=?]", interview_path(@interview), "post" do
    end
  end
end
