require 'rails_helper'

RSpec.describe "review_evidences/edit", type: :view do
  before(:each) do
    @review_evidence = assign(:review_evidence, ReviewEvidence.create!())
  end

  it "renders the edit review_evidence form" do
    render

    assert_select "form[action=?][method=?]", review_evidence_path(@review_evidence), "post" do
    end
  end
end
