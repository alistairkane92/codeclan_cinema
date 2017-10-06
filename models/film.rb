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

end
