require ("pry-byebug")
require_relative ("customer")
require_relative ("film")
require_relative ("ticket")

Ticket.delete_all()
Customer.delete_all()
Film.delete_all()


customer1 = Customer.new({"name" => "Michael", "funds" => 5})
customer1.save()

# customer1 = Customer.new({"name" => "Bob", "funds" => 10})
# customer1.update

customer2 = Customer.new({"name" => "Scott", "funds" => 50})
customer2.save()

customer3 = Customer.new({"name" => "James", "funds" => 25})
customer3.save()

customer4 = Customer.new({"name" => "John", "funds" => 35})
customer4.save()

film1 = Film.new({"title" => "Jurassic Park", "price" => 50})
film1.save()

film2 = Film.new({"title" => "Ghostbusters", "price" => 25})
film2.save()

film3 = Film.new({"title" => "Groundhog Day", "price" => 5})
film3.save()


# film1 = Film.new({"title" => "Event Horizon", "price" => 9})
# film1.update()

binding.pry
nil
