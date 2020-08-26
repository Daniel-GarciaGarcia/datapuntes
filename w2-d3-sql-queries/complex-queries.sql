
/*
SELECT t.title, concat(q.au_fname, " ", q.au_lname) fullname
	FROM titles as t 
		LEFT JOIN titleauthor as m 
		ON t.title_id = m.title_id
        LEFT JOIN authors as q
        ON q.au_id = m.au_id
	ORDER BY q.au_fname DESC
*/

/*
SELECT 
			concat(q.au_fname, " ", q.au_lname) fullname,
			count(*) num_books,
            group_concat(t.title) allbooks
	FROM titles as t 
		LEFT JOIN titleauthor as m 
		ON t.title_id = m.title_id
        LEFT JOIN authors as q
        ON q.au_id = m.au_id
	GROUP BY q.au_fname, q.au_lname
	ORDER BY q.au_fname DESC
*/

/*
SELECT state, count(*) FROM publications.authors 
	WHERE state="CA" OR state="KS" 
	GROUP BY state;
*/

/*
SELECT state, count(*) FROM publications.authors 
	WHERE state IN ("CA","KS") 
    GROUP BY state;
*/


# Temp Table
CREATE TEMPORARY TABLE  pepe(
	SELECT state, group_concat(au_fname), count(*) FROM authors GROUP BY state
);

# Union
SELECT city FROM authors WHERE state="UT"
UNION
SELECT city FROM authors WHERE state="KS"


# Operate with datetitme
SELECT pubdate FROM publications.titles WHERE year(pubdate) = 2014;