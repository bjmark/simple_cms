class SessionsController < ApplicationController
  def create
    session[:user_id] = 
      {
      'not_member' => '0',
      'member' => '1',
      'admin' => '2' }[params[:role]]
    
    redirect_to posts_path
  end
end
