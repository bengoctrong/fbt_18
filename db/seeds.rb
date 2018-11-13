User.create!(name: "Admin",
  email: "admin@test.com",
  phone: "0909999999",
  bank_number: "222-222-2222",
  address: "123 Suppasentai Street",
  password: "admin123",
  password_confirmation: "admin123",
  role: 0)

User.create!(name: "Example User",
  email: "caoduc2210@gmail.com",
  phone: "0901111111",
  bank_number: "111-222-2222",
  address: "123 Suppasentai Street",
  password: "user123",
  password_confirmation: "user123",
  role: 1)

20.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  phone = Faker::PhoneNumber.phone_number
  bank_number = Faker::Bank.swift_bic + "#{n}"
  address = Faker::Address.full_address
  User.create!(name: name,
    email: email,
    phone: phone,
    bank_number: bank_number,
    address: address,
    password: "user123",
    password_confirmation: "user123")
end

3.times do |n|
  name = "Category-#{n}"
  parent = Category.create!(name: name)
  3.times do |m|
    childname = "Child Category-#{parent.id}:#{m}"
    parent_id = parent.id
    Category.create!(name: childname, parent_id: parent_id)
  end
end

30.times do |n|
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

users = User.order(:created_at).take(6)
tours = Tour.order(:created_at).take(6)
tours.each do |tour|
  content = Faker::Lorem.sentence(5)
  quantity = 1
  users.each { |user| Review.create!(user_id: user.id, tour_id: tour.id, content: content)
    Booking.create!(user_id: user.id, tour_id: tour.id, quantity: quantity) }
end

Tour.all.each do |tour|
  if tour.id <= 10
    cat_id1 = Faker::Number.between(2,4)
    cat_id2 = Faker::Number.between(6,8)
    Categorytour.create!(category_id: cat_id1, tour_id: tour.id)
    Categorytour.create!(category_id: cat_id2, tour_id: tour.id)
  elsif 10 < tour.id && tour.id <= 20
    cat_id1 = Faker::Number.between(2,4)
    cat_id2 = Faker::Number.between(10,12)
    Categorytour.create!(category_id: cat_id1, tour_id: tour.id)
    Categorytour.create!(category_id: cat_id2, tour_id: tour.id)
  elsif 20 < tour.id && tour.id <= 30
    cat_id1 = Faker::Number.between(6,8)
    cat_id2 = Faker::Number.between(10,12)
    Categorytour.create!(category_id: cat_id1, tour_id: tour.id)
    Categorytour.create!(category_id: cat_id2, tour_id: tour.id)
  end
end

