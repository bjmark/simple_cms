require 'spec_helper'

describe PostsController do
  describe "GET index" do
    before do
      @post1 = Post.create!(:title => 'title1', :content => 'content1', :member_only => '1')
      @post2 = Post.create!(:title => 'title2', :content => 'content2', :member_only => '0')
    end
    it "not_member" do
      the_session = {:user_id => '0'}

      get :index, {}, the_session
      assigns(:posts).should eq([@post2])
    end

    it "member" do
      the_session = {:user_id => '1'}

      get :index, {}, the_session
      assigns(:posts).should eq([@post1, @post2])
    end
    
    it "admin" do
      the_session = {:user_id => '2'}

      get :index, {}, the_session
      assigns(:posts).should eq([@post1, @post2])
    end
  end

  describe "GET show" do
    it "not member valid" do
      post1 = Post.create!(:title => 'title1', :content => 'content1', :member_only => '0')
      
      the_session = {:user_id => '0'} #not_member
      
      get :show, {:id => post1.to_param}, the_session
      response.should render_template('show')
    end

    it "not_member invalid" do
      post1 = Post.create!(:title => 'title1', :content => 'content1', :member_only => '1')
      
      the_session = {:user_id => '0'} #not_member
      
      get :show, {:id => post1.to_param}, the_session
      response.should redirect_to('/error')
      #assigns(:post).should eq(post)
    end
  end

  describe "GET new" do
    it "admin valid" do
      the_session = {:user_id => '2'} #admin
      get :new, {}, the_session
      assigns(:post).should be_a_new(Post)
      response.should render_template('new')
    end

    it "member invalid" do
      the_session = {:user_id => '1'} #member
      get :new, {}, the_session
      response.should redirect_to('/error')
    end

    it "not_member invalid" do
      the_session = {:user_id => '0'} #not_member
      get :new, {}, the_session
      response.should redirect_to('/error')
    end
  end

  describe "GET edit" do
    it "admin valid" do
      post1 = Post.create!(:title => 'title1', :content => 'content1', :member_only => '1')
      
      the_session = {:user_id => '2'} #admin
      
      get :edit, {:id => post1.to_param}, the_session
      response.should render_template('edit')
    end

    it "member invalid" do
      post1 = Post.create!(:title => 'title1', :content => 'content1', :member_only => '1')
      
      the_session = {:user_id => '1'} #member
      
      get :edit, {:id => post1.to_param}, the_session
      response.should redirect_to('/error')
    end
  end
end

