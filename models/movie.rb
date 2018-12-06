
require_relative('../db/sql_runner')
require_relative('star')
require_relative('casting')

class Movie

  attr_accessor :title, :genre, :budget
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @budget = options['budget'].to_i
  end
  

  def self.delete_all()
    sql = "DELETE FROM movies"
    SqlRunner.run(sql)
  end

  def save()
    sql = "INSERT INTO movies ( title, genre, budget ) VALUES ( $1, $2, $3 ) RETURNING *"
    values = [@title, @genre, @budget]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def stars()
    sql = "SELECT stars.* FROM
           stars INNER JOIN castings
           ON castings.star_id = stars.id
           WHERE movie_id = $1"
    values = [@id]
    stars = SqlRunner.run(sql, values)
    return stars.map { | star| Star.new(star) }
  end

  def budget()
    return @budget
  end


end
