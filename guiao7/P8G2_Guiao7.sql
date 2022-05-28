--Ex 7.5 
--a)
	--i)
--CREATE VIEW TITLES_AUTHORS AS SELECT title, au_fname + ' ' + au_lname AS author FROM ((titles JOIN titleauthor ON titles.title_id = titleauthor.title_id) JOIN authors ON titleauthor.au_id = authors.au_id)

	--ii)
--CREATE VIEW PUBLISHERS_EMPLOYEES AS SELECT pub_name, fname + ' ' + lname AS employee FROM (publishers JOIN employee ON publishers.pub_id = employee.pub_id)
	
	--iii)
--CREATE VIEW STORES_TITLES AS SELECT stor_name, title FROM((stores JOIN sales ON stores.stor_id = sales.stor_id) JOIN titles ON sales.title_id = titles.title_id)

	--iv)
--CREATE VIEW BUSINESS_TYPE AS SELECT title FROM titles WHERE type = 'Business' 

--b)
	--i)
--SELECT * FROM TITLES_AUTHORS 

--ii)
--SELECT * FROM PUBLISHERS_EMPLOYEES WHERE employee LIKE 'An%'

	--iii)
--SELECT title FROM STORES_TITLES WHERE stor_name = 'Bookbeat'

	--iv)
--SELECT * FROM BUSINESS_TYPE

--c)
--CREATE VIEW TITLES_AUTHORS2 AS SELECT titles.title_id, title, au_fname + ' ' + au_lname AS author FROM ((titles JOIN titleauthor ON titles.title_id = titleauthor.title_id) JOIN authors ON titleauthor.au_id = authors.au_id);

--CREATE VIEW STORES_TITLES2 AS SELECT sales.title_id, stor_name, title FROM((stores JOIN sales ON stores.stor_id = sales.stor_id) JOIN titles ON sales.title_id = titles.title_id)

--SELECT stor_name, author FROM(TITLES_AUTHORS2 JOIN STORES_TITLES2 ON TITLES_AUTHORS2.title_id = STORES_TITLES2.title_id) ORDER BY stor_name

--d)
	--i) Não executou , pois essa a view não tem essas colunas

    --ii)
--CREATE VIEW BUSINESS_TYPE2 AS SELECT title_id, title, type, pub_id,price,notes FROM titles  

--insert into BUSINESS_TYPE2 (title_id, title, type, pub_id, price, notes) values('BDTst1', 'New BD Book','popular_comp', '1389', $30.00, 'A must-read for DB course.')
