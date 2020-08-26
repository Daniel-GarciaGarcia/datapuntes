#SELECT <columnas> FROM <tabla> WHERE <condicion>;
#SELECT * FROM authors WHERE au_fname="Albert";
#SELECT count(*) FROM authors WHERE state="KS" or state="UT";
#SELECT * FROM authors WHERE  state IN ("UT", "KS");
#SELECT sum(royaltyper) FROM titleauthor WHERE royaltyper > 80;

# JOIN -> https://ingenieriadesoftware.es/tipos-sql-join-guia-referencia/
#SELECT count(*) FROM titles LEFT JOIN titleauthor ON  titles.title_id=titleauthor.title_id;
#SELECT count(*) FROM titles INNER JOIN titleauthor ON  titles.title_id=titleauthor.title_id;

# Alias
#SELECT t.title, tta.au_id FROM titles AS t INNER JOIN titleauthor AS tta ON  t.title_id=tta.title_id;

# Multiple joins
/*
SELECT t.title, au.au_fname, au.au_lname
	FROM titles AS t 
    INNER JOIN titleauthor AS tta
    ON  t.title_id = tta.title_id
    INNER JOIN authors AS au
    ON tta.au_id = au.au_id
		WHERE au.au_fname="Marjorie"
*/

/*
SELECT t.title AS asdfasdf, au.au_fname AS Nombre, au.au_lname AS Apellido
	FROM titles AS t 
    INNER JOIN titleauthor AS tta
    ON  t.title_id = tta.title_id
    INNER JOIN authors AS au
    ON tta.au_id = au.au_id
*/

/*
SELECT t.title, concat(au.au_fname, " ", au.au_lname) AS FullName
	FROM titles AS t 
    INNER JOIN titleauthor AS tta
    ON  t.title_id = tta.title_id
    INNER JOIN authors AS au
    ON tta.au_id = au.au_id
*/

/*
# Aggregate functions: https://dev.mysql.com/doc/refman/8.0/en/group-by-functions.html
#https://dev.mysql.com/doc/refman/8.0/en/group-by-functions.html#function_group-concat
SELECT 
		t.title, 
        count(*) TotalAuthors, 
        group_concat(concat(au.au_fname, " ", au.au_lname) SEPARATOR " - ") Authors
	FROM titles AS t 
		INNER JOIN titleauthor AS tta
		ON  t.title_id = tta.title_id
		INNER JOIN authors AS au
		ON tta.au_id = au.au_id
	WHERE au.state IN("CA","KS")
    GROUP BY t.title
*/

#SELECT * FROM authors WHERE city="Oakland" ORDER BY au_fname ASC;
#SELECT * FROM authors ORDER BY au_fname DESC;
/*
SELECT 
		t.title, 
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
    GROUP BY t.title
    ORDER BY Authors
*/


# Authors by state
SELECT state, group_concat(au_fname), count(*) FROM authors GROUP BY state;