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


-- only want titles for final query

/*
select count(distinct "ftitle") from (
    select film.title as "ftitle", actor.first_name, actor.last_name, customer.first_name, customer.last_name
from actor
join film_actor using (actor_id)
join film using (film_id)
join inventory using (film_id)
join rental using (inventory_id)
join customer using (customer_id)
where film.title !~ 'F'
and actor.first_name || ' ' || actor.last_name !~ 'F'
and customer.first_name || ' ' || customer.last_name !~ 'F'
) t ;
*/

-- note: all film titles, actor first and last names, and customer first and last names are completely uppercase, so no need to check for lowercase 'f'.

-- final query
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
