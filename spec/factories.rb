FactoryGirl.define do

  factory :user do
    username { Faker::Lorem.word }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end

  factory :question do
    title {Faker::Lorem.sentence}
    body  {Faker::Lorem.paragraph}
    user
  end
  factory :answer do
    body {Faker::Lorem.sentence}
    user
    question
  end
end