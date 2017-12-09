require_relative('../db/SQLRunner.rb')

class Student

  attr_reader :first_name, :last_name, :house_id, :age

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house_id = options['house_id'].to_i
    @age = options['age']
  end

  def save
    sql = "INSERT INTO students
            (
              first_name,
              last_name,
              house_id,
              age
            )
            VALUES
            (
              $1, $2, $3, $4
            )
            RETURNING id"

    values = [@first_name, @last_name, @house_id, @age]

    @id = SQLRunner.run(sql, values)[0]['id'].to_i
  end

  def house
    sql = "SELECT * FROM houses WHERE id = $1"

    values = [@house_id]
    house = SQLRunner.run(sql, values)[0]
    result = House.new(house)
    return result
  end

  def self.all
    sql = "SELECT * FROM students"
    values = []

    students = SQLRunner.run( sql, values )
    result = students.map {|student| Student.new(student)}
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM students WHERE id = $1"
    values = [id]

    student = SQLRunner.run(sql, values)[0]
    return Student.new(student)
  end

end
