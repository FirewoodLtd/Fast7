require 'rails_helper'

RSpec.describe "review_evidences/new", type: :view do
  before(:each) do
    assign(:review_evidence, ReviewEvidence.new())
  end

  it "renders new review_evidence form" do
    render

    assert_select "form[action=?][method=?]", review_evidences_path, "post" do
    end
  end
end
