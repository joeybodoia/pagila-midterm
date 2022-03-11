/*
 * Count the number of distinct customers who have rented a movie that 'RUSSELL BACALL' has acted in.
 *
 * NOTE:
 * You cannot hard-code Russell Bacall's actor_id.
 * Your where clause must include a condition using the "first_name" and "last_name" fields of the "actor" table.
 */


-- first find movies that RUSSELL BACALL has acted in:
/*
select first_name || ' ' || last_name as "Actor Name", film_id from film_actor
join actor a using (actor_id)
where a.first_name || ' ' || a.last_name  = 'RUSSELL BACALL'
*/


/*
select 
    count(distinct customer_id) 
from customer
join rental using (customer_id)
join inventory using (inventory_id)
join film using (film_id)
join film_actor f using (film_id)
join actor using (actor_id)
where f.film_id in (
    select film_id from film_actor
    join actor a using (actor_id)
    where a.first_name || ' ' || a.last_name  = 'RUSSELL BACALL'
);
*/


-- simpler method: using RUSSELL BACALL'S actor_id (I think this is the method you're looking for):
-- final query:
select 
    count(distinct customer_id) 
from customer
join rental using (customer_id)
join inventory using (inventory_id)
join film using (film_id)
join film_actor using (film_id)
join actor a using (actor_id)
where 
    a.first_name || ' ' || a.last_name = 'RUSSELL BACALL'; 

