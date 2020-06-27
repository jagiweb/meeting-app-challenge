# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

file = File.open("./db/data.csv")
records = file.readlines.map(&:chomp)

for record in records
    columns = record.split(',')

    user_name = columns[0]

    msg_start_str = "2020-06-24T" + columns[1] + "+01:00"
    msg_end_str   = "2020-06-24T" + columns[2] + "+01:00"

    user = User.find_by(name: user_name)

    if user == nil        
        user = User.create(name: user_name)
    end

    Message.create(start_audio: DateTime.parse(msg_start_str), end_audio: DateTime.parse(msg_end_str), user_id: user.id)
end

file.close
