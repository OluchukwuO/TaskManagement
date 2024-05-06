# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Create an admin user
admin = User.create!(
  email: 'admin@example.com',
  password: 'password',
  role: :admin,
  name: 'rosy',
  username: 'rosy123'
)
puts "Admin user created: #{admin.email}"