require_relative('../db/SQLRunner.rb')

class House

	attr_reader(:id, :name, :image_url)

	def initialize(options)
		@id        = options['id'].to_i if options['id']
		@name      = options['name']
		@image_url = options['image_url']
	end

	def save()
		sql = 'INSERT INTO houses
            (
              name,
              image_url
            )
            VALUES(
                $1, $2
            )
            RETURNING id'

		values = [@name, @image_url]

		@id = SQLRunner.run(sql, values)[0]['id'].to_i
	end

	def self.all
		sql    = 'SELECT * FROM houses'
		values = []
		houses = SQLRunner.run(sql, values)
		result = houses.map { |house|
			House.new(house)
		}

		return result
	end

	def self.find(id)
		sql    = 'SELECT * FROM houses WHERE id = $1'
		values = [id]

		house = SQLRunner.run(sql, values)[0]
		return House.new(house)
	end
end
