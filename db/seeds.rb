User.create!(
             email: "mateusz@mateusz.com",
             password:              "mateusz",
             password_confirmation: "mateusz",
             confirmed_at: Time.zone.now)

User.create!(
             email: "janusz@janusz.com",
             password:              "janusz",
             password_confirmation: "janusz",
             confirmed_at: Time.zone.now)

User.create!(
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             confirmed_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(
               email: email,
               password:              password,
               password_confirmation: password,
               confirmed_at: Time.zone.now)

end