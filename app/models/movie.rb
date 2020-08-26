class Movie
  attr_reader :title,
              :genres,
              :runtime,
              :summary,
              :cast,
              :vote_average,
              :movie_id


  def initialize(data, id)
    @title = data[:title]
    @genres = data[:genres]
    @runtime = data[:runtime]
    @summary = data[:summary]
    @cast = data[:cast]
    @reviews = data[:reviews]
    @vote_average = data[:vote_average]
    @movie_id = id
  end

  def first_10_cast
    cast_hash = {}
    @cast.first(10).each do |cast_member|
      cast_hash[cast_member[:name]] = cast_member[:character]
    end
    cast_hash
  end

  def reviews_count
    @reviews.size
  end
end
