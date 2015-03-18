# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Type.create(name: 'N/A')
Type.create(name: 'Email')
Type.create(name: 'Dátum')
Type.create(name: 'Číslo')
Type.create(name: 'Miesto')
Type.create(name: 'Osoba')

User.create(
    name: 'admin',
    email: 'admin@admin.dp',
    password: '00000000',
    isAdmin: true,
    activated: true
)