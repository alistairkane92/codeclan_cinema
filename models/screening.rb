require_relative "../runner/sql_runner"

class Screening

    attr_accessor :ticket_id, :show_time
    attr_reader :id

    def initialize(options)
        @id = options['id'].to_i
        @ticket_id = options['ticket_id'].to_i
        @show_time = options['show_time']
    end

    def save()
        sql = "INSERT INTO screenings(ticket_id, show_time) VALUES ($1,$2) RETURNING ID;"
        values = [@ticket_id, @show_time]
        screenings_hash = SqlRunner.run(sql, "save_screening", values).first
        @id = screenings_hash['id'].to_i
    end

    def self.most_tickets_sold()
        sql = " SELECT COUNT(show_time), show_time  FROM screenings GROUP BY show_time;"
        values = []
        most_popular_hash = SqlRunner.run(sql, "most_popular_screening", values).first
        return most_popular_hash["show_time"]
    end

end
