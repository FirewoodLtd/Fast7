require 'rails_helper'

RSpec.describe "scores/new", type: :view do
  before(:each) do
    assign(:score, Score.new(
      :name => "MyString",
      :min => 1,
      :max => "",
      :color => "MyString"
    ))
  end

  it "renders new score form" do
    render

    assert_select "form[action=?][method=?]", scores_path, "post" do

      assert_select "input#score_name[name=?]", "score[name]"

      assert_select "input#score_min[name=?]", "score[min]"

      assert_select "input#score_max[name=?]", "score[max]"

      assert_select "input#score_color[name=?]", "score[color]"
    end
  end
end
