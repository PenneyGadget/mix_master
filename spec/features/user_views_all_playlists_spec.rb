require 'rails_helper'

RSpec.feature "User can view all playlists" do
  scenario "they see all playlists on playlist page" do
    playlists = ["playlist_1", "playlist_2", "playlist_3"].map do |name|
      Playlist.create(name: name)
    end

    visit playlists_path

    playlists.each do |playlist|
      expect(page).to have_content playlist.name
    end

    playlists.each do |playlist|
      expect(page).to have_link playlist.name, href: playlist_path(playlist)
    end
  end
end
