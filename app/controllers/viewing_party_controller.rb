class ViewingPartyController < ApplicationController
  def new
    movie = MovieData.all_movie_att(params[:movie_id])
    @movie = Movie.new(movie, params[:movie_id])
  end

  def create
    party = ViewParty.create(duration: params[:duration], date: params[:date], user: current_user, movie_id: params[:movie_id])

    attendees = params[:attendee]

    if attendees.nil?
      flash[:error] = "Don't watch this movie. Go find friends"
      redirect_to '/viewing_party/new'
    else
      attendees.each do |attendee_id|
        party.attendees.create(attendee_id: attendee_id)
      end
      redirect_to '/dashboard'
      flash[:message] = 'You have created a Viewing Party! Hooray!'
    end
    # CalendarService.new.create_event(party.host, party)
  end
end
