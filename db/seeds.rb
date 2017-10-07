# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env.production?
  begin
    email = ENV["SIMPLE_WIKI_ADMIN_EMAIL"]
    pwd = ENV["SIMPLE_WIKI_ADMIN_PASSWORD"]
    full_name = 'John Doe'
    role = 'Admin'
    User.create_with(email: email, password: pwd, role: role, full_name: full_name).find_or_create_by!(email: email)
  rescue
    raise SeedAdminENVError, SEED_ERROR_MSG
  end
else
  email = 'admin@simplewiki.com'
  pwd = 'asd123'
  full_name = 'John Doe'
  role = 'Admin'
  User.create_with(email: email, password: pwd, role: role, full_name: full_name).find_or_create_by!(email: email)
end
