require 'rails_helper'

RSpec.describe 'Movies index page' do
  before :each do
    visit '/movies'
  end

  it "I see a button to discover top rated movies" do
    within "#find-top-rated-movies" do
      expect(page).to have_button "Find Top Rated Movies"
    end
  end

  it "I can click the Find Top Rated Movies button to see the current 40 top rated movies" do
    visit '/movies'
    click_on 'Find Top Rated Movies'

    within '#movie-search-results' do
      expect(page).to have_content("Gabriel's Inferno Part II")
      expect(page).to have_content("Vote Average: 9.1")
      expect(page).to have_content("Gabriel's Inferno")
      expect(page).to have_content("Vote Average: 9")
    end
  end

  it "I see a text field with a 'Find Movies' button" do
    within "#find-movies" do
      expect(page.has_field? :search).to be_truthy
      expect(page).to have_button "Find Movies"
    end
  end

  it "I can search for a movie and I will see up top 40 results for that search" do
    fill_in :search, with: 'Last Airbender'
    click_on 'Find Movies'
    expect(current_path).to eq('/movies')

    within '#movie-search-results' do
      expect(page).to have_content("The Last Airbender")
      expect(page).to have_content("Vote Average: 4.7")
    end
  end

  it 'If no movie matches search result, user will recieve a message' do
    fill_in :search, with: 'do duh do duh sharks are mean'
    click_on 'Find Movie'
    expect(current_path).to eq('/movies')

    within '#movie-search-results' do
      expect(page).to have_content("No movies match your search request. Please try again.")
    end
  end
end
