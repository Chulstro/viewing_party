require 'rails_helper'

RSpec.describe MovieData do
  it "can get the data for a movie by movie id" do
    data = MovieData.all_movie_att('685621')
    expect(data.class).to eq(Hash)
    expect(data[:title]).to eq('The Last Airbender: Origins of the Avatar')
  end

  it "can get all movies" do
    data = MovieData.all_movies
    expect(data.class).to eq(Hash)
  end

  it 'can get the top 20 rated movies' do
    data = MovieData.top_20_movies_by_rating
    expect(data.class).to eq(Array)
    expect(data.size).to eq(20)
    expect(data.first[:title]).to eq('Gabriel\'s Inferno Part II')
  end
end
