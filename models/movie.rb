
require_relative('../db/sql_runner')

class Movie

  attr_accessor :title, :genre
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
  end

  def self.delete_all()
    sql = "DELETE FROM movies"
    SqlRunner.run(sql)
  end

  def save()
    sql = "INSERT INTO movies ( title, genre ) VALUES ( $1, $2 ) RETURNING *"
    values = [@title, @genre]
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




end
