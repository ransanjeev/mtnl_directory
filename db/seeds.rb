# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#

File.open("db/datafile.txt").each do |line|
	temp = line.split('|')
	DirectoryEntry.create :name => temp[1], :address=>temp[2], :phone=>temp[3]
end
