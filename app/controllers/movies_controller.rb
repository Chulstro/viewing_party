class MoviesController < ApplicationController
  def index
    @movie_details = MovieData.search_results(params[:search]) if params[:search].nil? == false
    return @movie_details = MovieData.top_20_rated_movies if params[:q]
  end

  def show
    movie_info = MovieData.all_movie_att(params[:id])
    @movie = Movie.new(movie_info)
  end
end
