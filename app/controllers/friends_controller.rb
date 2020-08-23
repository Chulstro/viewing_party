class FriendsController < ApplicationController
  def create
    friend = User.find_by(email: params[:email])
    if friend.nil?
      flash[:error] = "That email does not exist"
      redirect_to "/dashboard"
    elsif current_user.friends.exists?(friend.id)
      flash[:error] = "That email belongs to a current friend"
      redirect_to "/dashboard"
    else
      Friend.create(user_id: current_user.id, friend_id: friend.id)
      redirect_to "/dashboard"
    end
  end
end
