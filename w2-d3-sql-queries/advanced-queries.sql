# 1a) title_id for authors in CA
/*
SELECT titles.title_id FROM authors
	INNER JOIN titleauthor ON authors.au_id=titleauthor.au_id
    INNER JOIN titles ON titles.title_id=titleauthor.title_id
	WHERE state="CA"
    GROUP BY  titles.title_id
*/

# Subqueries
/*SELECT sum(qty) FROM sales WHERE title_id IN (
	SELECT titles.title_id FROM authors
		INNER JOIN titleauthor ON authors.au_id=titleauthor.au_id
		INNER JOIN titles ON titles.title_id=titleauthor.title_id
		WHERE state="CA"
		GROUP BY  titles.title_id
)*/

# Sales for authors living in california
/*SELECT * FROM (
 SELECT titles.title_id as q FROM authors
		INNER JOIN titleauthor ON authors.au_id=titleauthor.au_id
		INNER JOIN titles ON titles.title_id=titleauthor.title_id
		WHERE state="CA"
		GROUP BY  titles.title_id
) as q
LEFT JOIN sales ON sales.title_id = q
*/


# 2 - The authors from CA or KS print the revenue, title and authors names for books with 2 or more authors
#2a) - How much $ gets all authors from a book per unit sold
/*SELECT 
		titles.title_id, 
        title, 
        concat(round(price*avg(roysched.royalty) / 100,2),"$") AS authors_mean_revenue
	FROM titles 
		INNER JOIN roysched 
        ON roysched.title_id=titles.title_id
        GROUP BY titles.title_id, title, price
*/
#2b) Join both tables and print all info
SELECT calc.title, Authors, authors_mean_revenue FROM (
	SELECT 
			t.title,
            t.title_id,
			count(*) TotalAuthors, 
			group_concat(
				concat(au.au_fname, " ", au.au_lname) 
				ORDER BY au.au_fname 
				SEPARATOR " - " 
				) Authors
		FROM titles AS t 
			INNER JOIN titleauthor AS tta
			ON  t.title_id = tta.title_id
			INNER JOIN authors AS au
			ON tta.au_id = au.au_id
		WHERE au.state IN("CA","KS")
		GROUP BY t.title, t.title_id
		ORDER BY Authors
) as calc 
INNER JOIN (
	SELECT 
			titles.title_id, 
			title, 
			concat(round(price*avg(roysched.royalty) / 100,2),"$") AS authors_mean_revenue
		FROM titles 
			INNER JOIN roysched 
			ON roysched.title_id=titles.title_id
			GROUP BY titles.title_id, title, price
) as royals
ON royals.title_id =  calc.title_id
WHERE calc.TotalAuthors >=2

