require "faker"

FactoryBot.define do
  factory :post do
    title { Faker::Hipster.words }
    body { Faker::Hipster.sentence }
    image_url "/root_url/some_file_name.jpg"
    user
  end
end
