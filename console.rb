
require('pry')
require_relative('./models/movie')


movie1 = Movie.new({ 'title' => 'Aqua Man', 'genre' => 'Superhero' })
movie1.save()








binding.pry
nil
