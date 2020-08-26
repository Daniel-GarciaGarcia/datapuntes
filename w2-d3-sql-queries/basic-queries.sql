#SELECT * FROM authors WHERE contract=1;
#SELECT * FROM authors WHERE contract=1 and (state="UT" or state="MI");
#SELECT * FROM authors WHERE state="UT" or state="MI";
#SELECT * FROM authors WHERE state="UT" or state="MI" or state="CA";
#SELECT * FROM authors WHERE state IN ("UT","MI","CA");

# Agregations
#SELECT sum(royaltyper) FROM titleauthor;
#SELECT avg(royaltyper) FROM titleauthor WHERE au_ord > 1;
#SELECT avg(royaltyper) FROM titleauthor WHERE au_ord = 1;

# Alias
#SELECT avg(royaltyper) AS media FROM titleauthor WHERE au_ord = 1;
#SELECT avg(royaltyper) media FROM titleauthor WHERE au_ord = 1;
#SELECT au_lname as fasdf, au_fname as asdfa FROM authors WHERE contract=1;
#SELECT au_fname nombre, au_lname apellido FROM authors WHERE contract=1;

# Transform data
#SELECT concat(au_fname, " ",au_lname) fullname FROM authors WHERE contract=1;
#SELECT year(ord_date), title_id FROM sales;
#SELECT unix_timestamp(ord_date, title_id FROM sales;

# Joins
/*
SELECT qty, title FROM sales
	LEFT JOIN titles ON sales.title_id = titles.title_id;
*/
/*
SELECT * FROM titleauthor 
	LEFT JOIN titles on titleauthor.title_id = titles.title_id;
*/  

/*
SELECT * FROM titles
	LEFT JOIN titleauthor on titleauthor.title_id = titles.title_id
	LEFT JOIN authors on titleauthor.au_id = authors.au_id
 */
 /*
SELECT title, au_fname, au_lname  FROM titles
	LEFT JOIN titleauthor on titleauthor.title_id = titles.title_id
	LEFT JOIN authors on titleauthor.au_id = authors.au_id
*/

/*
SELECT title, au_fname, au_lname  
		FROM titles t
	INNER JOIN titleauthor ta on ta.title_id = t.title_id
	LEFT JOIN authors a on ta.au_id = a.au_id;
*/
/*
SELECT * 
	FROM titles t
		INNER JOIN titleauthor ta on ta.title_id = t.title_id
		LEFT JOIN authors a on ta.au_id = a.au_id
    WHERE year(pubdate)> 1991;
*/

# GROUP BY

/*
SELECT title, count(au_fname) num_authors
FROM titles t
	INNER JOIN titleauthor ta on ta.title_id = t.title_id
	LEFT JOIN authors a on ta.au_id = a.au_id
GROUP BY title;
*/
/*
SELECT title, t.title_id, count(au_fname) num_authors, group_concat(au_fname), sum(royaltyper)
FROM titles t
	INNER JOIN titleauthor ta on ta.title_id = t.title_id
	LEFT JOIN authors a on ta.au_id = a.au_id
GROUP BY title, t.title_id;
*/

# https://dev.mysql.com/doc/refman/5.7/en/group-by-functions.html#function_group-concat
/*SELECT title, group_concat(concat(au_fname," ",au_lname))
FROM titles t
	INNER JOIN titleauthor ta on ta.title_id = t.title_id
	LEFT JOIN authors a on ta.au_id = a.au_id
GROUP BY title;*/

/*SELECT title, group_concat(concat(au_fname," ",au_lname) SEPARATOR "*")
FROM titles t
	INNER JOIN titleauthor ta on ta.title_id = t.title_id
	LEFT JOIN authors a on ta.au_id = a.au_id
GROUP BY title;*/

/*
SELECT title, group_concat(concat(au_fname," ",au_lname) SEPARATOR "*") as authors
FROM titles t
	INNER JOIN titleauthor ta on ta.title_id = t.title_id
	LEFT JOIN authors a on ta.au_id = a.au_id
GROUP BY title
ORDER BY title DESC;
*/
/*
SELECT title,min(au_fname),max(au_fname)
FROM titles t
	INNER JOIN titleauthor ta on ta.title_id = t.title_id
	LEFT JOIN authors a on ta.au_id = a.au_id
GROUP BY title
ORDER BY title DESC;
*/
    