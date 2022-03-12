/*
 * You want to watch a movie tonight.
 * But you're superstitious,
 * and don't want anything to do with the letter 'F'.
 * List the titles of all movies that:
 * 1) do not have the letter 'F' in their title,
 * 2) have no actors with the letter 'F' in their names (first or last),
 * 3) have never been rented by a customer with the letter 'F' in their names (first or last).
 *
 * NOTE:
 * Your results should not contain any duplicate titles.
 */


-- final query:
select 
    film.title
from actor
join film_actor using (actor_id)
join film using (film_id)
join inventory using (film_id)
join rental using (inventory_id)
join customer using (customer_id)
where film.title !~ 'F'
  and actor.first_name || ' ' || actor.last_name !~ 'F'
  and customer.first_name || ' ' || customer.last_name !~ 'F'
group by film.title;
