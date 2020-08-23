class MovieData
  def self.all_movie_att(movie_id)
    data = movie_details(movie_id)
    cast = movie_cast(movie_id)
    reviews = movie_reviews(movie_id)
    {
      summary: data[:overview],
      title: data[:title],
      runtime: data[:runtime],
      genres: data[:genres],
      reviews: reviews[:results],
      cast: cast[:cast],
      vote_average: data[:vote_average]
    }
  end

  def self.search_results(search_request)
    data = search(search_request)
    data[:results].first(40)
  end

  def self.search(search_request)
    TheMovieDBService.new.search(search_request)
  end

  def self.all_movies
    TheMovieDBService.new.movies
  end

  def self.movie_details(movie_id)
    TheMovieDBService.new.movie_details(movie_id)
  end

  def self.movie_reviews(movie_id)
    TheMovieDBService.new.reviews(movie_id)
  end

  def self.movie_cast(movie_id)
    TheMovieDBService.new.cast(movie_id)
  end

  def self.top_rated_movies
    TheMovieDBService.new.toprated
  end

  def self.top_20_movies_by_rating
    top_rated_movies[:results].first(20)
  end
end
