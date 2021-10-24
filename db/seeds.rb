# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
    email: 'xiangtaishiqiao0@gmail.com',
    password: 'asdfghjkl'
    )
Admin.create!(
    email: 'aiueo@gmail.com',
    password: 'kakikukeko'
    )

Customer.create!(
    email: 'sho@gmail.com',
    first_name: 'myouji',
    last_name: 'namae',
    password: 'shota07'
    )
Customer.create!(
    email: 'shot@gmail.com',
    first_name: 'myouj',
    last_name: 'nama',
    password: 'shota070'
    )
