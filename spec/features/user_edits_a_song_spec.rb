require 'rails_helper'

RSpec.feature "User edits an exisiting song" do
  scenario "they update the song title" do
    artist = create(:artist)
    song = artist.songs.create(title: "No Woman No Cry")

    visit song_path(song)

    click_on "Edit Song"
    fill_in "Title", with: "I Shot the Sheriff"
    click_on "Update Song"

    expect(page).to have_content "I Shot the Sheriff"
    expect(page).to have_link artist.name, href: artist_path(artist)
  end
end
