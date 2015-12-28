require 'rails_helper'

RSpec.feature "User can view all artists" do
  scenario "they view all existing artists" do
    Artist.create(name: "Bob Marley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    Artist.create(name: "Ani DiFranco", image_path: "https://s-media-cache-ak0.pinimg.com/originals/4f/6e/56/4f6e56c491e1200b00a74c9a9c48f2ee.jpg")
    dls = Artist.create(name: "De La Soul", image_path: "http://vignette3.wikia.nocookie.net/hip-hop-music/images/6/6a/De_La_Soul.jpg/revision/latest?cb=20131128075618")
    artists = Artist.all

    visit artists_path

    artists.each do |artist|
      expect(page).to have_content artist.name
      expect(page).to have_link artist.name
    end

    click_on "De La Soul"
    expect(page).to have_content "De La Soul"
    expect(page).to have_css("img[src=\"#{dls[:image_path]}\"]")
  end
end
