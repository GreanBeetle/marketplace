Product.destroy_all
Book.destroy_all

10.times do |i|
  Product.create!(:name => Faker::Coffee.blend_name, :price => Faker::Number.decimal(2))
end

20.times do |i|
  @title = Faker::Book.title
  @available = Faker::Boolean.boolean(0.5)
  Book.create!(title: @title, available: @available)
end

p "Created #{Book.count} shirts"
p "Created #{Product.count} products."
