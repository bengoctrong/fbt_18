User.create!(name: "Admin",
  email: "admin@test.com",
  phone: "0909999999",
  bank_number: "222-222-2222",
  address: "123 Suppasentai Street",
  password: "admin123",
  password_confirmation: "admin123",
  role: 0)

20.times do |n|
  name = Faker::Name.name
  description = Faker::Lorem.paragraph(5)
  quantity = Faker::Number.between(10, 40)
  start_date = Faker::Date.forward(30)
  end_date = Faker::Date.between(start_date, start_date + Faker::Number.between(3, 10).days)
  seats_remaining = quantity
  Tour.create!(name: name, description: description,quantity: quantity,
    start_date: start_date, end_date: end_date, price: 2000, seats_remaining: seats_remaining)
end
