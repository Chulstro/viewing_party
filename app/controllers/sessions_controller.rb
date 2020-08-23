class SessionsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    user = User.update_and_create(auth['info']['name'], auth['info']['email'])
    user = User.find_by(email: auth['info']['email'])
    session[:user_id] = user.id
    redirect_to '/dashboard'
  end
end
