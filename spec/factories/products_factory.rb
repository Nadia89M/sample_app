FactoryBot.define do
  factory :product do
    name "Bike"
    description "Race Bike"
    image_url "bike1.jpg"
    created_at Time.now
    updated_at Time.now
    colour "red"
    price 99
    id 3
  end
end
