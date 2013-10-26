require 'spec_helper'

describe User do
  specify "user role" do
    User.find('0').role.should == 'not_member'
    User.find('1').role.should == 'member'
    User.find('2').role.should == 'admin'
  end
end
