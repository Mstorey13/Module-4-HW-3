-- HOMEWORK 3

-- List all customers who live in Texas (use JOINs)
-- Full join 
-- customer and address
select customer.first_name, customer.last_name, district
from customer
full join address
on customer.address_id = address.address_id
where district = 'Texas';
-- 5

-- Get all payments above $6.99 with the Customer's Full Name
-- Right join
select first_name, last_name, payment_id, amount
from customer 
full join payment 
on customer.customer_id = payment.customer_id
where amount > 6.99;
-- 29 

-- Show all customers names who have made payments over $175(use subqueries)
select * 
from customer 
where customer_id IN(
	select customer_id 
	from payment
	group by customer_id 
	having sum(amount) < 175
	order by sum(amount) desc 
);
-- 597 customers 

-- List all customers that live in Nepal (use the city table)
SELECT customer.first_name, customer.last_name, customer.email, country
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
FULL JOIN city
ON address.city_id = city.city_id
FULL JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';
-- Kevin Schuler 

-- Which staff member had the most transactions?
select first_name, last_name, tx_id, tx_amount
FROM staff
INNER JOIN transactions_s
ON staff.staff_id = transactions_s.staff_id;

-- How many movies of each rating are there?
select movie_id, content_rating, rating_id
from movie
inner join movie_ratings 
on movie.movie_id = movie_ratings.rating_id;



-- Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT customer_id,amount
FROM payment
WHERE amount > 6.99;

-- How many free rentals did our stores give away?
select payment_id, amount, rental_id, inventory_id
from payment
full join rental
on payment.payment_id = rental.rental_id;

