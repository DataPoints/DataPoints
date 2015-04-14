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
Type.create(name: 'IČO')
Type.create(name: 'Firma')

file = File.read("app/lib/FirstDataset/FirstDataset.csv")
csv = CSV.parse(file, :col_sep => ';')

csv.shift
csv.each do |row|
  FirstDataset.create(Obchodne_meno: row[0], PSC: row[1], Ulica: row[2], Mesto_Obec: row[3], ICO: row[4], Vyska_pohladavky: row[5], Typ_platitela: row[6])
end

User.create(
    name: 'admin',
    email: 'admin@admin.dp',
    password: '00000000',
    isAdmin: true,
    activated: true
)

users=User.all

users.each do |user|
  DatasetFactory.new.firstDataset(user.id)
end