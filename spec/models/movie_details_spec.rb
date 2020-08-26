require 'rails_helper'

RSpec.describe Movie do
  before :each do
    @data = MovieData.all_movie_att('685621')
    @result = Movie.new(@data, '685621')
  end

  it 'instance exist' do
    assert_instance_of Movie, @result
  end

  it 'has attributes' do
    expect(@result.title).to eq(@data[:title])
    # expect(@result.genres).to eq(@data[:genres])
    expect(@result.runtime).to eq(@data[:runtime])
    expect(@result.summary).to eq(@data[:summary])
    expect(@result.cast).to eq(@data[:cast])
    # expect(@result.reviews).to eq(@data[:reviews])
    expect(@result.vote_average).to eq(@data[:vote_average])
  end

  it 'can list the first 10 cast members along with who their character' do
    cast = {"Bryan Konietzko"=>"", "Michael Dante DiMartino"=>""}

    expect(@result.first_10_cast).to eq(cast)
  end

  it 'has total review count' do
    expect(@result.reviews_count).to eq(0)
  end

  it 'creates an array of review objects' do
    expect(@result.reviews).to eq([])
  end

  it 'creates an array of genre objects' do
    expect(@result.genres.class).to eq(Array)
    expect(@result.genres.first.class).to eq(Genre)
  end
end
