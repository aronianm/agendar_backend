# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


users = [
    {fname: 'Steve', lname: 'Harrington', email: 'Steve.Harrington1@gmail.com', phone_number: '978-564-3123', password: 'secret'},
    {fname: 'Jennifer', lname: 'Aronian', email: 'Jen.mp12@gmail.com', phone_number: '774-573-5663', password: 'secret'},
    {fname: 'Kaitlyn', lname: 'Buckley', email: 'kaitlynaronian@gmail.com', phone_number: '978-726-5508', password: 'secret'},
]
users.each do |u|
    user = User.create!(u)
    TeamPlayer.create(
        team_id: 10,
        user_id: user.id
    )
end
