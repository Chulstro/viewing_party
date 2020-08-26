require 'rails_helper'

RSpec.describe 'Create new viewing party' do
  before :each do
    stub_auth
    visit '/'
    click_on 'Login with Google'
    @user = User.last
    @data = MovieData.all_movie_att('685621')
    @movie_id = ('685621')
  end

  it 'has a form' do
    visit "/movies/#{@movie_id}"
    click_on "Create Viewing Party"

    find_field :duration
    find_field :date
    find_button "Create Viewing Party"
  end

  it "If I have no added friends, I will see a flash message" do
    visit "/movies/#{@movie_id}"
    click_on "Create Viewing Party"

    expect(page).to have_content("You currently have no friends")
  end

  it 'can show the details of this viewing party' do
    friend_1 = User.create(name: "Jennine", email: "example@email.com")
    Friend.create(user: @user, friend_id: friend_1.id)
    friend_2 = User.create(name: "Jeordan", email: "example2@email.com")
    Friend.create(user: @user, friend_id: friend_2.id)

    id = 685621
    data = MovieData.all_movie_att(id)
    movie = MovieData.movie_details(id)

    visit "/movies/#{id}"

    click_on "Create Viewing Party"

    fill_in :duration, with: 200
    fill_in :date, with: "09/12/2020"

    within "#friend#{friend_2.id}" do
      check "attendee[]"
    end

    click_on "Create Viewing Party"

    expect(current_path).to eq("/dashboard")

    expect(page).to have_content("Movie Title: #{movie[:title]}")
    expect(page).to have_content("Duration: 200")
    #expect(page).to have_content("Date: 09/12/2020")
    expect(page).to have_content("Attendees: #{friend_2.name}")
  end
end
