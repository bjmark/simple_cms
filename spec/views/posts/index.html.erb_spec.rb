require 'spec_helper'

describe "posts/index" do
  before(:each) do
    assign(:posts, [
      stub_model(Post,
        :title => "Title",
        :description => "MyText",
        :member_only => "Member Only"
      ),
      stub_model(Post,
        :title => "Title",
        :description => "MyText",
        :member_only => "Member Only"
      )
    ])
  end

  it "renders a list of posts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Member Only".to_s, :count => 2
  end
end
