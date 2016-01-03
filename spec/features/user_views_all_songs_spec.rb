require 'rails_helper'

RSpec.feature "User can view all songs" do
  scenario "they view all exisiting songs for an artist in alphabetical order" do
    artist = create(:artist_with_songs)
    songs = Song.all

    visit artist_path(artist)
    click_on "View Songs"

    expect(page).to have_content "A Title"
    expect(page).to have_selector "ul#songs li:nth-child(1)", text: "A Title"
    expect(page).to have_selector "ul#songs li:nth-child(2)", text: "B Title"
    expect(page).to have_selector "ul#songs li:nth-child(3)", text: "C Title"

    #order below is due to the order songs are made in the factory
    expect(page).to have_link "A Title", href: song_path(songs[0])
    expect(page).to have_link "C Title", href: song_path(songs[1])
    expect(page).to have_link "B Title", href: song_path(songs[2])
  end
end
