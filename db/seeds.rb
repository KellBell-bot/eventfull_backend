# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
user1 = User.create(full_name: "Luke James", username: "test", password: "test")


event1= user1.events.create(title: "Thinkful Webinar | UX/UI Design: Creating a Design System", link:"https://www.eventbrite.com/e/thinkful-webinar-uxui-design-creating-a-design-system-tickets-149797501359?aff=ebdssbcitybrowse", date_field: Date.new(2021,05,03), fee: false)