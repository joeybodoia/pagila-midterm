/*
 * List the titles of all films in the 'Children' category that have a rating of 'R' or 'NC-17'.
 *
 * NOTE:
 * Your results should not contain any duplicate titles.
 */


/*
select title, name, rating from film
join film_category using (film_id)
join category using (category_id)
where name = 'Children'
and (rating = 'R' or rating = 'NC-17');
*/

-- final query:
select 
    distinct title 
from film f
join film_category using (film_id)
join category c using (category_id)
where c.name = 'Children'
  and (f.rating = 'R' or f.rating = 'NC-17');




