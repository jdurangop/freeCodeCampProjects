DROP TABLE IF EXISTS appointments;
DROP TABLE IF EXISTS services;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers(
  customer_id SERIAL PRIMARY KEY,
  phone VARCHAR(20) NOT NULL UNIQUE,
  name TEXT NOT NULL
);

CREATE TABLE services(
  service_id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE appointments(
  appointment_id SERIAL PRIMARY KEY,
  customer_id INT NOT NULL REFERENCES customers(customer_id),
  service_id INT NOT NULL REFERENCES services(service_id),
  time VARCHAR(20) NOT NULL
);

INSERT INTO services(name)
VALUES ('Nail polish'), ('Haircut'), ('Facial detox');