require 'spec_helper'

describe Post do
  context "for_role" do
    before(:each) do
      Post.create!(:title => 'title1', :content => 'content1', :member_only => '1')
      Post.create!(:title => 'title2', :content => 'content2', :member_only => '0')
    end
    specify 'member and admin' do
      Post.count.should == 2
      Post.for_role('member').count.should == 2
    end

    specify 'not_member' do
      Post.for_role('not_member').count.should == 1
    end
  end
end
