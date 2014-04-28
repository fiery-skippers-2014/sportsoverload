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

  factory :vote do
    voteable_type { nil }
    voteable_id { nil }
    vote_type { nil }

  end

  factory :answer do
    body {Faker::Lorem.sentence}
    user
    question
  end
  
  factory :comment do
    body {Faker::Lorem.sentence}
    user
    question
  end

end