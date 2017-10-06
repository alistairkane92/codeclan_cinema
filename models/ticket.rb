require "../runner/sql_runner"
require_relative "customer"
require_relative "film"

class Ticket

    attr_accessor :name, :funds
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





end
