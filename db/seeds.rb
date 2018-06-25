User.create!(name: "Admin",
  email: "admin@test.com",
  phone: "0909999999",
  bank_number: "222-222-2222",
  address: "123 Suppasentai Street",
  password: "admin123",
  password_confirmation: "admin123",
  role: 0)

User.create!(name: "Example User",
  email: "user@test.com",
  phone: "0901111111",
  bank_number: "111-222-2222",
  address: "123 Suppasentai Street",
  password: "user123",
  password_confirmation: "user123",
  role: 1)

20.times do |n|
  name = Faker::Name.name
  description = Faker::Lorem.paragraph(5)
  quantity = Faker::Number.between(10, 40)
  start_date = Faker::Date.forward(30)
  end_date = Faker::Date.between(start_date, start_date + Faker::Number.between(3, 10).days)
  seats_remaining = quantity
  remote_picture_url = "https://www.vntrip.vn/cam-nang/wp-content/uploads/2017/06/Trang-an-ninh-binh-1.jpg"
  Tour.create!(name: name, description: description,quantity: quantity,
    start_date: start_date, end_date: end_date, price: 2000, seats_remaining: seats_remaining,
    remote_picture_url: remote_picture_url)
end
