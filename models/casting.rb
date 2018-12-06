
require_relative('../db/sql_runner')
require_relative('star')
require_relative('movie')

class Casting

  attr_accessor :movie_id, :star_id, :fee
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @movie_id = options['movie_id'].to_i
    @star_id = options['star_id'].to_i
    @fee = options['fee'].to_i
  end


  def self.delete_all()
    sql = "DELETE FROM castings"
    SqlRunner.run(sql)
  end

  def save()
    sql = "INSERT INTO castings ( movie_id, star_id, fee ) VALUES ( $1, $2, $3 ) RETURNING *"
    values = [@movie_id, @star_id, @fee]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def fees()
    return @fee
  end

  # def self.star()
  #   sql = "SELECT fee FROM castings WHERE castings.star_id = $1"
  #   values = [@id]
  #   fees = SqlRunner.run(sl, values)
  #   binding.pry
  #   return fees.map { |fee| fee }
  # end


end
