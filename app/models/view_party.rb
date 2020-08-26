class ViewParty < ApplicationRecord
  belongs_to :user
  has_many :attendees

  def find_movie_title
    data = MovieData.all_movie_att(movie_id)
    data[:title]
  end

  def all_invited
    attendees.map do |attendee|
      User.find(attendee.attendee_id)
    end
  end
end
