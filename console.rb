
require('pry')
require_relative('./models/movie')
require_relative('./models/star')
require_relative('./models/casting')

Casting.delete_all()
Movie.delete_all()
Star.delete_all()


movie1 = Movie.new({ 'title' => 'Face Off', 'genre' => 'Action' })
movie1.save()
movie2 = Movie.new({ 'title' => 'The Rock', 'genre' => 'Action' })
movie2.save()
movie3 = Movie.new({ 'title' => 'Pulp Fiction', 'genre' => 'Cult' })
movie3.save()


star1 = Star.new({ 'first_name' => 'Nicholas', 'last_name' => 'Cage' })
star1.save()
star2 = Star.new({ 'first_name' => 'John', 'last_name' => 'Travolta' })
star2.save()


casting1 = Casting.new({ 'movie_id' => movie1.id, 'star_id' => star1.id, 'fee' => 1000000})
casting1.save()
casting2 = Casting.new({ 'movie_id' => movie2.id, 'star_id' => star1.id, 'fee' => 1500000})
casting2.save()
casting3 = Casting.new({ 'movie_id' => movie1.id, 'star_id' => star2.id, 'fee' => 1500000})
casting3.save()
casting4 = Casting.new({ 'movie_id' => movie3.id, 'star_id' => star2.id, 'fee' => 1500000})
casting4.save()








binding.pry
nil
