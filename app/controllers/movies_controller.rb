class MoviesController < ApplicationController
  def index
    @movie_details = MovieData.search_results(params[:search]) if params[:search].nil? == false
    return @movie_details = MovieData.top_20_rated_movies if params[:q]
  end
end
