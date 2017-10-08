require ("pry-byebug")
require_relative ("customer")
require_relative ("film")
require_relative ("ticket")
require_relative ("screening")

Ticket.delete_all()
Customer.delete_all()
Film.delete_all()

film1 = Film.new({"title" => "Jurassic Park", "price" => 50})
film1.save()

film2 = Film.new({"title" => "Ghostbusters", "price" => 25})
film2.save()

film3 = Film.new({"title" => "Groundhog Day", "price" => 5})
film3.save()

film4 = Film.new({"title" => "Nutty Professor", "price" => 100})
film4.save()

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


ticket1 = Ticket.new({"customer_id" => customer1.id, "film_id" => film1.id})
ticket1.save()

ticket2 = Ticket.new({"customer_id" => customer2.id, "film_id" => film2.id})
ticket2.save()

ticket3 = Ticket.new({"customer_id" => customer3.id, "film_id" => film3.id})
ticket3.save()

ticket4 = Ticket.new({"customer_id" => customer4.id, "film_id" => film4.id})
ticket4.save()

ticket5 = Ticket.new({"customer_id" => customer2.id, "film_id" => film3.id})
ticket5.save()

ticket6 = Ticket.new({"customer_id" => customer4.id, "film_id" => film1.id})
ticket6.save()

customer2.pay_for_tickets

screening1 = Screening.new({"ticket_id" => ticket1.id, "show_time" => "2017-10-12 10:00:00"})
screening1.save()

screening2 = Screening.new({"ticket_id" => ticket2.id, "show_time" => "2017-10-12 09:30:00"})
screening2.save()

screening3 = Screening.new({"ticket_id" => ticket3.id, "show_time" => "2017-10-12 18:45:00"})
screening3.save()




# film1 = Film.new({"title" => "Event Horizon", "price" => 9})
# film1.update()

binding.pry
nil
