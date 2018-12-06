
require_relative('../db/sql_runner')

class Star

  attr_accessor :first_name, :last_name
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

  def self.delete_all()
    sql = "DELETE FROM stars"
    SqlRunner.run(sql)
  end

  def save()
    sql = "INSERT INTO stars ( first_name, last_name ) VALUES ( $1, $2 ) RETURNING *"
    values = [@first_name, @last_name]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def movies()
    sql = "SELECT movies.* FROM
           movies INNER JOIN castings
           ON castings.movie_id = movies.id
           WHERE star_id = $1"
    values = [@id]
    movies = SqlRunner.run(sql, values)
    return movies.map { | movie| Movie.new(movie) }
  end






end
