require 'rails_helper'

RSpec.describe 'Movies show page' do
  before :each do
    visit '/movies'
    fill_in :search, with: "Avatar"
    click_on "Find Movies"
  end

  it "When visiting a page, I should see details of that movie" do
    within "#0" do
      click_on "Avatar"
    end
    expect(page).to have_content(7.4)
    expect(page).to have_content("162 minutes")
    expect(page).to have_content("Action")
    expect(page).to have_content("Sam Worthington playing as Jake Sully")
    expect(page).to have_content(2)
    expect(page).to have_content("daisyrowley")
    expect(page).to have_content("In the 22nd century")
    expect(page).to have_link("Create Viewing Party")
  end
end
