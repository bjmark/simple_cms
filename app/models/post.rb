class Post < ActiveRecord::Base
  attr_accessible :content, :member_only, :title
  scope :for_role, lambda {|role| ['member', 'admin'].include?(role) ? where('') : where(:member_only => '0')}
end
