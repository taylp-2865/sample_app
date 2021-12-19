User.create!(name: "Lê Phương Tây",
  email: "tay@gmail.com",
  password: "lephuongtay",
  password_confirmation: "lephuongtay",
  admin: true,
  activated: true,
  activated_at: Time.zone.now)
  50.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    User.create!(name: name,
      email: email,
      password: password,
      password_confirmation: password,
      activated: true,
      activated_at: Time.zone.now)
  end
