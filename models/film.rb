require "../runner/sql_runner"

class Film

    attr_accessor :title, :price
    attr_reader :id

    def initialize(options)
        @id = options['id'].to_i
        @title = options['title']
        @price = options['price']
    end

    def self.delete_all()
        sql = "DELETE FROM films;"
        values = []
        SqlRunner.run(sql, "delete_all_films", values)
    end

    def self.select_all()
        sql = "SELECT * FROM films;"
        values = []
        film_data = SqlRunner.run(sql, "select_all_films", values)
        return film_data.map{|film| Film.new(film)}
    end

    def save()
        sql = "INSERT INTO films(title, price) VALUES ($1, $2) RETURNING id;"
        values = [@title, @price]
        film_hash = SqlRunner.run(sql, "save_film", values).first
        @id = film_hash['id'].to_i
    end

    def update()
        sql = "UPDATE films SET (title, price) = ($1, $2) WHERE id = $3;"
        values = [@title, @price, @id]
        SqlRunner.run(sql, "update_films", values)
    end

    def delete()
        sql = "DELETE FROM films WHERE id = $1;"
        values = [@id]
        SqlRunner.run(sql, "delete_film", values)
    end

    def customers()
        sql = "SELECT customers.* from customers INNER JOIN tickets ON tickets.customer_id = customers.id
                WHERE film_id = $1 "
        values = [@id]
        result = SqlRunner.run(sql, "customers_from_films", values)
        return result.map {|film| Customer.new(film)}
    end

end
