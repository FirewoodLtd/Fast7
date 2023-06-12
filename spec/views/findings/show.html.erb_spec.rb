require 'rails_helper'

RSpec.describe "findings/show", type: :view do
  before(:each) do
    @finding = assign(:finding, Finding.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
