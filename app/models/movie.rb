class Movie
  attr_reader :title,
              :genres,
              :runtime,
              :summary,
              :cast,
              :vote_average

  def initialize(data)
    @title = data[:title]
    @genres_data = data[:genres]
    @runtime = data[:runtime]
    @summary = data[:summary]
    @cast = data[:cast]
    @reviews_data = data[:reviews]
    @vote_average = data[:vote_average]
  end

  def first_10_cast
    cast_hash = {}
    @cast.first(10).each do |cast_member|
      cast_hash[cast_member[:name]] = cast_member[:character]
    end
    cast_hash
  end

  def reviews_count
    @reviews_data.size
  end

  def reviews
    review_hash = []
    @reviews_data.each do |review|
      review_hash << Review.new(review)
    end
    review_hash
  end

  def genres
    genres_hash = []
    @genres_data.each do |genre|
      genres_hash << Genre.new(genre)
    end
    genres_hash
  end
end
