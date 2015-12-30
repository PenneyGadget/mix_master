require 'rails_helper'

RSpec.feature "User submits a new song" do
  scenario "they see the page for the individual song" do
    artist = create(:artist)
    song = "No Woman No Cry"

    visit artist_path(artist)
    click_on "New Song"
    fill_in "song_title", with: song
    click_on "Create Song"

    expect(page).to have_content song
    expect(page).to have_link artist.name, href: artist_path(artist)
  end

  context "the user does not enter a song title" do
    scenario "they get an error message" do
      artist = create(:artist)

      visit artist_path(artist)
      click_on "New Song"
      click_on "Create Song"

      expect(page).to have_content "Title can't be blank"
    end
  end
end
