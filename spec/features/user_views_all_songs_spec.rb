require 'rails_helper'

RSpec.feature "User can view all songs" do
  scenario "they view all exisiting songs for an artist in alphabetical order" do
    pending
    artist = create(:artist)
    artist.songs.create(title: "Think Locally, Fuck Globally")
    artist.songs.create(title: "Start Wearing Purple")
    artist.songs.create(title: "Alcohol")

    visit artist_path(artist)
    click_on "View Songs"

    expect(page).to match "Alcohol\nStart Wearing Purple\nThink Locally, Fuck Globally"
    expect(page).to have_link song.name, href: song_path(song)
  end
end
