FactoryGirl.define do
  factory :artist do
    name "Gogol Bordello"
    image_path "https://upload.wikimedia.org/wikipedia/commons/0/03/Gogol_Bordello_at_the_Aggie_Theatre.jpg"
  end

  factory :song do
    title "Alcohol"
  end
end
