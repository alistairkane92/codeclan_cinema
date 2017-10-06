require ("pry-byebug")
require_relative ("customer")
require_relative ("film")
require_relative ("ticket")

Customer.delete_all()
Film.delete_all()
Ticket.delete_all()

customer1 = Customer.new({"name" => "Michael", "funds" => 5})
customer1.save

customer2 = Customer.new({"name" => "Scott", "funds" => 50})
customer2.save

customer3 = Customer.new({"name" => "James", "funds" => 25})
customer3.save

customer4 = Customer.new({"name" => "John", "funds" => 35})
customer4.save

binding.pry
nil
