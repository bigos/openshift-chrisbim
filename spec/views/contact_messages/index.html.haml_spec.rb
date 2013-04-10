require 'spec_helper'

describe "contact_messages/index" do
  before(:each) do
    assign(:contact_messages, [
      stub_model(ContactMessage,
        :from => "From",
        :subject => "Subject",
        :message => "MyText"
      ),
      stub_model(ContactMessage,
        :from => "From",
        :subject => "Subject",
        :message => "MyText"
      )
    ])
  end

  it "renders a list of contact_messages" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "From".to_s, :count => 2
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
