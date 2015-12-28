require 'rails_helper'

RSpec.feature "User deletes an artist" do
  scenario "artist is no longer listed on site" do
    artist = Artist.create(name: "De La Soul", image_path: "http://vignette3.wikia.nocookie.net/hip-hop-music/images/6/6a/De_La_Soul.jpg/revision/latest?cb=20131128075618")

    visit artist_path(artist)
    click_on "Delete Artist"

    expect(current_path).to eq artists_path
    expect(page).to_not have_content "De La Soul"
  end
end
