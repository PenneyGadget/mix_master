require 'rails_helper'

RSpec.feature "User edits an existing playlist" do
  scenario "they see the updated attributes" do
    playlist = create(:playlist_with_songs)
    song_one, song_two, song_three = create_list(:song, 3) #default playlist name = "Playlist #{n}"
    new_song = create(:song)
    new_playlist_name = "Better Playlist"

    visit playlist_path(playlist)
    click_on "Edit"
    fill_in "playlist_name", with: new_playlist_name
    uncheck("song-#{song_two.id}")
    check("song-#{new_song.id}")
    click_on "Update Playlist"

    expect(page).to have_content new_playlist_name
    click_on "Better Playlist"

    expect(page).to have_content new_song.title
    expect(page).to_not have_content song_two.title
  end
end
