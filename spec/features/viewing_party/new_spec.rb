require "rails_helper"

RSpec.describe "When I make a new viewing party from the movie show page" do
  before :each do
    @user = User.create!(name: "Chuck Norris", email: "GOAT@gmail.com")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it "Has a form to create a new party" do
    visit "/movies"
    fill_in :search, with: "Avatar"
    click_on "Find Movies"
    within "#0" do
      click_on "Avatar"
    end
    click_on "Create Viewing Party"
    expect(current_path).to eq("/viewing_parties/new")
  end
end
