require "rails_helper"

RSpec.describe 'As a user visiting the dashboard' do
  before :each do
    stub_auth
    visit '/'
    click_on "Login with Google"
  end

  it "has a main screen and links" do
    User.create(name: "Jennine", email: "example@email.com")
    User.create(name: "Jeordan", email: "example2@email.com")
    expect(current_path).to eq("/dashboard")
    within "#friends" do
      expect(page).to have_field(:email)
      expect(page).to have_content("You currently have no friends")
      fill_in :email, with: "example@email.com"
      click_on "Add Friend"
      expect(current_path).to eq("/dashboard")
      expect(page).to have_content("Jennine")
    end

  end

  it "won't let you add an email that doesn't exist or is already a friend" do
    User.create(name: "Jennine", email: "example@email.com")
    User.create(name: "Jeordan", email: "example2@email.com")
    within "#friends" do
      fill_in :email, with: "example@email.com"
      click_on "Add Friend"
      expect(page).to have_content("Jennine")
      fill_in :email, with: "example3@email.com"
      click_on "Add Friend"
      expect(current_path).to eq("/dashboard")
    end
    expect(page).to have_content("That email does not exist")

    within '#friends' do
      fill_in :email, with: "example@email.com"
      click_on "Add Friend"
    end
    expect(page).to have_content("That email belongs to a current friend")

  end
end
