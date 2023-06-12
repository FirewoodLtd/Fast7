require 'rails_helper'

RSpec.describe "review_evidences/show", type: :view do
  before(:each) do
    @review_evidence = assign(:review_evidence, ReviewEvidence.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
