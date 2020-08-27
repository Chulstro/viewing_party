class MoviesController < ApplicationController
  def index
    if params[:search].nil? == false
      @movie_details = MovieData.search_results(params[:search])
    else !params[:q].nil?
         @movie_details = MovieData.top_40_movies_by_rating
    end
  end

  def show
    movie_info = MovieData.all_movie_att(params[:id])
    @movie = Movie.new(movie_info, params[:id])
  end
end
