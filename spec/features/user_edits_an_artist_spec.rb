require 'rails_helper'

RSpec.feature "User edits an exisiting artist" do
  scenario "they update the artists name" do
    artist = create(:artist)

    visit artist_path(artist)
    click_on "Edit Artist"
    fill_in "artist_name", with: "Bob Marley and the Wailers"
    click_on "Update Artist"

    expect(page).to have_content "Bob Marley and the Wailers"
    expect(page).to have_css("img[src=\"#{artist[:image_path]}\"]")
  end
end
