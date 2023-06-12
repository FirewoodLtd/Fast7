require 'rails_helper'

RSpec.describe "review_evidences/index", type: :view do
  before(:each) do
    assign(:review_evidences, [
      ReviewEvidence.create!(),
      ReviewEvidence.create!()
    ])
  end

  it "renders a list of review_evidences" do
    render
  end
end
