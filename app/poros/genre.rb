class Genre
  attr_reader :name

  def initialize(genre_info)
    @name = genre_info[:name]
  end
end
