require 'rails_helper'

RSpec.describe "interviews/show", type: :view do
  before(:each) do
    @interview = assign(:interview, Interview.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
