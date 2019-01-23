--TABLE - PEOPLE

CREATE TABLE person 
(
  id SERIAL,
  name VARCHAR(999),
  age INTEGER,
  height INTEGER,
  city VARCHAR(666),
  favorite_color VARCHAR(333)
  );

INSERT INTO person(name, age, height, city, favorite_color)
VALUES 
('Kavacichak', 1000, 215, 'Boric', 'Puce'),
('Ba', 2, 157, 'Kuala Lampur', 'Mauve'),
('Mage', 43, 165, 'Detroit', 'Periwinkle'),
('Vaugn', 27, 183, 'Caledonia', 'Ochre'),
('Zoe', 105, 105, 'Dublin', 'Marigold');

--I selected for just names to display, but you can ask for all information with * or select data to display by stringing together column values with commas.

SELECT name FROM person ORDER BY height DESC;

SELECT name FROM person ORDER BY height;

SELECT name FROM person ORDER BY age DESC;

SELECT name FROM person WHERE age>20;

SELECT name FROM person WHERE age=18; 

SELECT name FROM person WHERE age<20 AND age>30;

SELECT name FROM person WHERE age<>27;

SELECT name FROM person WHERE favorite_color NOT LIKE 'red';
SELECT name FROM person WHERE favorite_color<>'red'; --can also use != symbol


SELECT name FROM person WHERE favorite_color NOT LIKE 'red' OR 'blue';
SELECT name FROM person WHERE favorite_color<>'red' OR 'blue'; --can also use != symbol

SELECT name FROM person WHERE favorite_color='orange' OR favorite_color='green';
SELECT name FROM person WHERE favorite_color IN ('orange','green');

SELECT name FROM person WHERE favorite_color='orange' OR favorite_color='green' OR favorite_color='blue'; --long way to do it...
SELECT name FROM person WHERE favorite_color IN ('orange','green', 'blue');

SELECT name, favorite_color FROM person WHERE favorite_color IN ('yellow', 'purple')




--TABLE - ORDERS

--was told tables are usually singular, but directions say orders with an 's'
CREATE TABLE orders 
(
  person_id SERIAL, 
  product_name VARCHAR(666), 
  product_price DECIMAL, 
  quantity INTEGER
  );

--the answer says to inclued a value for the person_id but that is assigned when you set the person id to serial when creating the table
INSERT INTO orders (product_price, product_name, quantity) 
VALUES
(19.99, 'WhirlyGig', 17),
(12.99, 'ThingAMaBob', 3),
(69.99, 'Widget', 2),
(66.66, 'Rocks', 1),
(99.99, 'TechPak', 6);

SELECT * from orders;

SELECT sum(quantity) FROM orders;

SELECT sum(product_price*quantity) FROM orders;

--****not sure why but anwer sums the product of price and quantity?*****************************
SELECT product_price * quantity FROM orders WHERE person_id IN (2);




--TABLE - ARTIST

INSERT INTO artist (name)
VALUES
('DeadMau5'),
('The GasLamp Killer'),
('Magic Drum Orchestra');

--I selected for just names to display, but you can ask for all information with * or select data to display by stringing together column values with commas.
SELECT name FROM artist ORDER BY name DESC LIMIT 10;

SELECT name FROM artist ORDER BY name LIMIT 5;

SELECT name FROM artist WHERE name LIKE 'Black%';

SELECT name FROM artist WHERE name LIKE '%Black%';



--TABLE - EMPLOYEE

SELECT first_name, last_name FROM employee WHERE city = 'Calgary';

SELECT * FROM employee ORDER BY birth_date DESC Limit 1;
--Solution: SELECT MAX(birth_date) from employee;

SELECT * FROM employee ORDER BY birth_date Limit 1;
--Solution: SELECT MIN(birth_date) from employee;

SELECT * FROM employee WHERE first_name IN ('Nancy');
SELECT * FROM employee WHERE reports_to IN (2);
--Solution: SELECT * FROM employee WHERE reports_to = 2;

--***SELECT COUNT('Lethbridge') FROM employee; this solution returns 8*****************
--Solution:
SELECT COUNT(*) FROM employee WHERE city = 'Lethbridge';



--TABLE - INVOICE

SELECT COUNT(*) FROM invoice WHERE billing_country='USA';

SELECT MAX(total) FROM invoice; 

SELECT MIN(total) FROM invoice;

SELECT * FROM invoice WHERE total > 5;

SELECT COUNT(*) FROM invoice WHERE total < 5;

SELECT COUNT(*) FROM invoice WHERE billing_state IN ('CA', 'TX', 'AZ');

SELECT AVG(total) FROM invoice;

SELECT SUM(total) FROM invoice;
