require "../runner/sql_runner"
require_relative "customer"
require_relative "film"

class Ticket

    attr_accessor :customer_id, :film_id
    attr_reader :id

    def initialize(options)
        @id = options['id'].to_i
        @customer_id = options['customer_id'].to_i
        @film_id = options['film_id'].to_i
    end

    def self.delete_all()
        sql = "DELETE FROM tickets;"
        values = []
        SqlRunner.run(sql, "delete_all_tickets", values)
    end

    def self.select_all()
        sql = "SELECT * FROM tickets;"
        values = []
        SqlRunner.run(sql, "select_all_tickets", values)
    end

    def save()
        sql = "INSERT INTO tickets(customer_id, film_id) VALUES ($1, $2) RETURNING id;"
        values = [@customer_id, @film_id]
        tickets_hash = SqlRunner.run(sql, "save_tickets", values).first
        @id = tickets_hash['id'].to_i
    end

    def update()
        sql = "UPDATE tickets SET (customer_id, film_id) = ($1,$2) WHERE id = $3;"
        values = [@customer_ids, @film_id, @id]
        SqlRunner.run(sql, "update_tickets", values)
    end

    def delete()
        sql = "DELETE FROM tickets WHERE id = $1;"
        values = [@id]
        SqlRunner.run(sql, "delete_ticket", values)
    end



end
