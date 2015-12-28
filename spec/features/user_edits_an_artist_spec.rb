require 'rails_helper'

RSpec.feature "User edits an exisiting artist" do
  scenario "they update the artists name" do
    artist = Artist.create(name: "Bob Marley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")

    visit artist_path(artist)
    click_on "Edit Artist"
    fill_in "artist_name", with: "Bob Marley and the Wailers"
    click_on "Update Artist"

    expect(page).to have_content "Bob Marley and the Wailers"
    expect(page).to have_css("img[src=\"#{artist[:image_path]}\"]")
  end
end
