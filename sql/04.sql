/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch similar movies.
 * You've already watched all other movies with the same actors,
 * so now you need a new strategy for finding similar movies.
 * You decide that two movies X and Y are similar if they have been rented by the same customer,
 * and you further quantify this similarity by defining the "similarity score" to be the number of distinct customers that have rented both X and Y.
 *
 * Write a SQL SELECT query that:
 * computes the "similarity score" for all movies with 'AMERICAN CIRCUS'
 * and orders the results from highest to lowest.
 *
 * NOTE:
 * Your results should not contain any duplicate titles.
 *
 * NOTE:
 * You do not have to include movies with similarity score 0 in your results (but you may if you like).
 */

-- first find customer ids of customers who have rented American Circus
/*
select distinct customer_id
from customer
join rental using (customer_id)
join inventory using (inventory_id)
join film f using (film_id)
where f.title = 'AMERICAN CIRCUS';
*/


-- note: the same customer can rent a movie more than once
-- ex: customer_id 251 rented WHISPERER GIANT twice, but that should only count as one customer when comparing to AMERICAN CIRCUS

-- final query:
select 
    f.title, 
    count(distinct c.customer_id) as "similarity score"
from film f
join inventory using (film_id)
join rental using (inventory_id)
join customer c using (customer_id)
where c.customer_id in (
    select distinct customer_id
    from customer
    join rental using (customer_id)
    join inventory using (inventory_id)
    join film using (film_id)
    where title = 'AMERICAN CIRCUS'
)
group by f.title
order by "similarity score" desc;

