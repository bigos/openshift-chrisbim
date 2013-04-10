require 'spec_helper'

describe "comments/new" do
  before(:each) do
    assign(:comment, stub_model(Comment,
      :post_id => 1,
      :content => "MyText"
    ).as_new_record)
  end

  it "renders new comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", comments_path, "post" do
      assert_select "input#comment_post_id[name=?]", "comment[post_id]"
      assert_select "textarea#comment_content[name=?]", "comment[content]"
    end
  end
end
