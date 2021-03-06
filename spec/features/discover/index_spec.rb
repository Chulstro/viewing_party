require "rails_helper"

RSpec.describe "Discover Index Page" do
  describe "As a authenticated user" do
    before :each do
      @user = User.create!(name: "Chuck Norris", email: "GOAT@gmail.com")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end

    it "I see a button to \"Discover Movies\"" do
      visit "/dashboard"
      expect(page).to have_button "Discover Movies"
    end

    it "When I click the Discover Movies button, I am redirected to a discover page." do
      visit "/dashboard"

      within "#discover-movies" do
        click_button "Discover Movies"
      end
      expect(current_path).to eq(discover_index_path)
    end

    describe "When I visit the discover index page" do
      before :each do
        visit discover_index_path
      end

      it "I see a button to discover top rated movies" do
        within "#find-top-rated-movies" do
          expect(page).to have_button "Find Top Rated Movies"
        end
      end

      it "When I click the button to discover top rated movies, I am redirected to the movies index where I see the top 40 movies" do

        within "#find-top-rated-movies" do
          click_on "Find Top Rated Movies"
        end
        expect(current_path).to eq('/movies')

        within '#movie-search-results' do
          expect(page).to have_content("Gabriel's Inferno Part II")
          expect(page).to have_content("Vote Average: 9.1")
          expect(page).to have_content("Gabriel's Inferno")
          expect(page).to have_content("Vote Average: 9")
        end
      end

      it "I see a text field with a 'Find Movies' button" do
        within "#find-movies" do
          expect(page).to have_button "Find Movies"
          expect(page.has_field? :search).to be_truthy
        end
      end

      it "When I fill in the text field with a movie title and click the find movies button, I am redirected to the movies index where I see the results for my search" do
        within "#find-movies" do
          fill_in :search, with: "The Last Airbender"
          click_on "Find Movies"
        end
        expect(current_path).to eq('/movies')
        expect(page).to have_content("The Last Airbender")
        expect(page).to have_content("Vote Average: 4.7")
      end
    end
  end
end
