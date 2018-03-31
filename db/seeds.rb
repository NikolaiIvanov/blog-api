# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

if User.count.zero?
  User.create!(
    name: 'John Doe',
    email: 'user@example.com',
    password: 'password',
    password_confirmation: 'password'
  )
  puts "-----\n User: #{User.first.name}, has created. \n-----"
end

if Post.count.zero?
  10.times do
    post = Post.create(
      title: Faker::Company.name,
      body: Faker::Hipster.paragraph,
      created_by: User.first.id)
    5.times do
      Comment.create(
        name: Faker::Name.name ,
        body: Faker::Hipster.paragraph,
        published: true,
        post_id: post.id )
    end
  end
  puts "-----\n #{Post.count} Posts with #{Comment.count} comments, has created. \n-----"
end
