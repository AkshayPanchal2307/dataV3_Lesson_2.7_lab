-- How many films are there for each of the categories in the category table. Use appropriate join to write this query.

SELECT * FROM category;
SELECT c.name, COUNT(f.film_id) as "num_films"
FROM sakila.category c
INNER JOIN sakila.film_category f
ON c.category_id = f.category_id
GROUP BY c.name

-- Display the total amount rung up by each staff member in August of 2005.

SELECT staff_id, SUM(amount) AS total_amount
FROM sakila.payment
WHERE payment_date LIKE '%2005-08%'
GROUP BY staff_id;

-- Which actor has appeared in the most films?

SELECT (a.first_name) AS 'Name', COUNT(f.film_id) as "num_film"
FROM sakila.actor a
INNER JOIN sakila.film_actor f
ON a.actor_id = f.actor_id
ORDER BY 'n_movies' DESC

-- Most active customer (the customer that has rented the most number of films)

SELECT * FROM rental;
SELECT rental.customer_id AS 'Most_Active_Customer', COUNT(DISTINCT rental_id) as "num_rentals"
FROM sakila.rental
ORDER BY 'num_rentals' DESC
limit 1;

-- Display the first and last names, as well as the address, of each staff member
SELECT * FROM sakila.address;
SELECT * FROM sakila.staff;
select f.first_name, f.last_name, a.address, a.address2, a.district from sakila.staff as f 
inner join sakila.address as a 
on f.address_id = a.address_id
GROUP BY a.district;

-- List each film and the number of actors who are listed for that film.

SELECT film_actor.actor_id, film.title, COUNT(film_actor.actor_id) AS "num_actors" FROM film_actor
INNER JOIN film
ON film_actor.film_id = film.film_id
GROUP BY film.title
ORDER BY 'num_actors';


-- Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

SELECT * FROM payment;
SELECT p.customer_id, c.last_name, round(SUM(p.amount),2) AS total_paid
FROM sakila.payment AS p
INNER JOIN customer as c
ON p.customer_id = c.customer_id
GROUP BY customer_id
ORDER BY c.last_name ASC;


-- List number of films per category.

SELECT * FROM sakila.film_category;
SELECT * FROM sakila.category;
SELECT name as cat, Count(a.film_id) as 'num_films' from sakila.film_category as a
inner join sakila.category as c
on a.category_id = c.category_id
GROUP BY name;

