require_relative "../runner/sql_runner"

class Customer

    attr_accessor :name, :funds
    attr_reader :id

    def initialize(options)
        @id = options['id'].to_i
        @name = options['name']
        @funds = options['funds']
    end

    def Customer.delete_all()
        sql = "DELETE FROM customers;"
        values =[]
        SqlRunner.run(sql, "delete_all_customers", values)
    end

    def Customer.select_all()
        sql = "SELECT * FROM customers;"
        values = []
        customer_data = SqlRunner.run(sql, "select_all_customers", values)
        return customer_data.map{|customer| Customer.new(customer)}
    end

    def save()
        sql = "INSERT INTO customers(name, funds) VALUES ($1, $2) RETURNING id;"
        values = [@name, @funds]
        customer_hash = SqlRunner.run(sql, "save_customer", values).first
        @id = customer_hash['id'].to_i
    end

    def update()
        sql = "UPDATE customers SET (name, funds) = ($1,$2) WHERE id = $3;"
        values = [@name, @funds, @id]
        SqlRunner.run(sql, "update_customer", values)
    end

    def delete()
        sql = "DELETE FROM customers WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, "delete_customer", values)
    end

    def films()
        sql = "SELECT films.* FROM films INNER JOIN tickets ON tickets"
        values =
        result = SqlRunner.run(sql, "customer_films", values)
        result.map{|customer| Customer.new(customer)}
    end

end
