require 'pg'
require_relative '../models/customer'
require_relative '../models/film'
require_relative '../models/ticket'

class SqlRunner

    def self.run(sql, tag, values)
        begin
            db = PG.connect({dbname: "codeclan_cinema", host: "localhost"})
            db.prepare(tag, sql)
            result = db.exec_prepared(tag, values)
        ensure
            db.close()
        end
        return result
    end


end
