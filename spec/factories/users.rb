FactoryGirl.define do
  factory :user do
    # fullname "MyString"
    # email "MyString"
    # password_digest "MyString"

    sequence(:fullname) {Faker::Name.name}
    sequence(:email) {|n| "#{n}.#{Faker::Internet.email}" }
    password Faker::Internet.password

  end

end
