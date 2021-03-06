DROP TABLE IF EXISTS screenings;
DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS films;


CREATE TABLE customers(
    id SERIAL8 PRIMARY KEY,
    name VARCHAR(255),
    funds INT4
);

CREATE TABLE films(
    id SERIAL8 PRIMARY KEY,
    title VARCHAR(255),
    price INT4
);

CREATE TABLE tickets(
    id SERIAL8 PRIMARY KEY,
    customer_id INT4 REFERENCES customers(id) ON DELETE CASCADE,
    film_id INT4 REFERENCES films(id) ON DELETE CASCADE
);

CREATE TABLE screenings(
    id SERIAL8 PRIMARY KEY,
    ticket_id INT4 REFERENCES tickets(id) ON DELETE CASCADE,
    show_time DATE
);
