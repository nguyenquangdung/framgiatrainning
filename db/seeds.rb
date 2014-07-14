# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
trainee_list = [
["Nguyen Van A","nguyenvana@gmail.com",123456],
["Nguyen Van B","nguyenvanb@gmail.com",123456],
["Nguyen Van C","nguyenvanc@gmail.com",123456],
["Nguyen Van D","nguyenvand@gmail.com",123456],
["Nguyen Van E","nguyenvane@gmail.com",123456],
["Nguyen Van F","nguyenvanf@gmail.com",123456]
]
trainee_list.each do |trainee|
	Trainee.create( :name=>trainee[0], :email=>trainee[1], :password=>trainee[2])
end

supervisor_list[
["Nguyen  A","nguyena@gmail.com",123456],
["Nguyen  B","nguyenb@gmail.com",123456],
["Nguyen  C","nguyennc@gmail.com",123456],
["Nguyen  D","nguyend@gmail.com",123456],
["Nguyen  E","nguyene@gmail.com",123456],
["Nguyen  F","nguyenf@gmail.com",123456]
]
supervisor_list.each do |trainee|
	Supervisor.create( :name=>supervisor[0], :email=>supervisor[1], :password=>supervisor[2])
end