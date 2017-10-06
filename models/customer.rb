require_relative "../runner/sql_runner"

class Customer

    attr_accessor :name, :funds
    attr_reader :id

    def initialize(options)
        @id = options['id'].to_i
        @name = options['name']
        @funds = options['funds']
    end

    def self.delete_all()
        sql = "DELETE FROM customers;"
        values =[]
        SqlRunner.run(sql, "delete_all_customers", values)
    end

    def self.select_all()
        sql = "SELECT * FROM customers;"
        values = []
        SqlRunner.run(sql, "select_all_customers;", values)
    end

    def save()
        sql = "INSERT INTO customers(name, funds) VALUES ($1, $2) RETURNING id;"
        values = [@name, @funds]
        customer = SqlRunner.run(sql, "save_customer", values).first
        @id = customer['id'].to_i
    end

    def update()
        sql = "UPDATE INTO customers(name, funds) = ($1,$2) WHERE id; = $3"
        values = [@name, @funds, @id]
        SqlRunner(sql, "update_customer", values)
    end




end
