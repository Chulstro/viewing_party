class MoviesController < ApplicationController
  def index
    if params[:search].nil? == false
      @movie_details = MovieData.search_results(params[:search])
    else params[:q].nil? == false
      @movie_details = MovieData.top_40_movies_by_rating
    end
  end
end
