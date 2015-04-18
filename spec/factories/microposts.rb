FactoryGirl.define do
  factory :micropost do
    content Faker::Lorem.sentence(3)
    user 1
  end

end
