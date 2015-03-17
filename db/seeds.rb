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

file = File.read("app/lib/FirstDataset/FirstDataset.csv").force_encoding('Windows-1250').encode('UTF-8')
csv = CSV.parse(file, :col_sep => ';')

csv.shift
csv.each do |row|

  FirstDataset.create(Obchodne_meno:row[0], PSC:row[1],Ulica:row[2],Mesto_Obec:row[3],ICO:row[4],Vyska_poladavky:row[5])
end
