# In this lab, you will be using the Sakila database of movie rentals.
use sakila;

# 1. List the number of films per category.
SELECT 
    category.name AS category,
    COUNT(film_category.category_id) AS number_of_films
FROM
    category
        JOIN
    film_category ON category.category_id = film_category.category_id
GROUP BY category.name;

# 2. Display the first and the last names, as well as the address, of each staff member.
SELECT 
    first_name, last_name, address
FROM
    staff
        JOIN
    address ON staff.address_id = address.address_id;

# 3. Display the total amount rung up by each staff member in August 2005.
SELECT 
    staff_id, SUM(amount) AS total_amount
FROM
    payment
WHERE
    payment_date BETWEEN "2005-08-01" AND "2005-08-31"
GROUP BY staff_id;

# 4. List all films and the number of actors who are listed for each film.
SELECT 
    film.title, COUNT(film_actor.actor_id) AS number_of_actors
FROM
    film
        JOIN
    film_actor ON film.film_id = film_actor.film_id
GROUP BY film.title;

# 5. Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.
SELECT 
    CONCAT(customer.first_name,
            ' ',
            customer.last_name) AS customer_name,
    SUM(payment.amount) AS total_amount_paid
FROM
    payment
        JOIN
    customer ON payment.customer_id = customer.customer_id
GROUP BY customer.first_name , customer.last_name
ORDER BY customer.last_name ASC;