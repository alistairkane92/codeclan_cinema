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
        sql = "DELETE FROM customers WHERE id = $1;"
        values = [@id]
        SqlRunner.run(sql, "delete_customer", values)
    end

    def films()
        sql = "SELECT films.* FROM films INNER JOIN tickets ON tickets.film_id = films.id
                WHERE customer_id = $1;"
        values = [@id]
        result = SqlRunner.run(sql, "customer_films", values)
        result.map{|customer| Film.new(customer)}
    end

    def ticket_count()
        sql = "SELECT id FROM tickets WHERE customer_id = $1;"
        values = [@id]
        results = SqlRunner.run(sql, "count_tickets", values)
        return results.count
    end

    def pay_for_tickets()
        sql = "SELECT SUM(price) FROM films INNER JOIN tickets ON tickets.film_id = films.id
                WHERE customer_id = $1 "
        values = [@id]
        total_cost_hash = SqlRunner.run(sql, "pay_for_ticket", values).first
        amount = total_cost_hash["sum"]
        @funds -= amount.to_i
    end

        # puts "The hash looks like #{total_cost_hash}"
        # amount = total_cost_hash.map{|cost| cost["sum"]}

        # puts "The hash after looks like #{amount}"



        # puts "The hash after looks like #{amount}"

end
