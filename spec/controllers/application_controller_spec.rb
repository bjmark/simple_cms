require 'spec_helper'

describe ApplicationController do
  context "current_user" do
    specify do
      current_user.role.should == 'not_member'
    end
  end
end
