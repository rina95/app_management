# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   videos = Video.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", video: videos.first)
User.create first_name: 'phan', last_name: 'bt', birthday: '1/1/1990', address: 'HN', email: 'phanbt@example.com', password: '12345678', confirmed_at: Time.current
