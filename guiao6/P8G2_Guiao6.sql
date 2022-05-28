--a
--SELECT * FROM authors 

--b
--SELECT au_fname, au_lname, phone FROM authors

--c
--SELECT au_fname, au_lname, phone FROM authors ORDER BY au_fname, au_lname

--d
--SELECT au_fname AS first_name, au_lname AS last_name, phone AS telephone FROM authors ORDER BY au_fname, au_lname

--e
--SELECT au_fname AS first_name, au_lname AS last_name, phone AS telephone FROM authors WHERE state='CA' AND au_lname <> 'Ringer'  ORDER BY au_fname, au_lname 

--f
--SELECT * FROM publishers WHERE pub_name LIKE '%Bo%'

--g
--SELECT DISTINCT pub_name FROM (publishers JOIN titles ON publishers.pub_id=titles.pub_id) WHERE type = 'Business'

--h
--SELECT pub_name,SUM(qty) AS pub_sales FROM ((sales JOIN titles ON sales.title_id=titles.title_id) JOIN publishers on titles.pub_id=publishers.pub_id) GROUP BY pub_name

--i
--SELECT pub_name,title,SUM(qty) AS pub_sales FROM ((sales JOIN titles ON sales.title_id=titles.title_id) JOIN publishers on titles.pub_id=publishers.pub_id) GROUP BY pub_name, titles.title

--j
--SELECT title FROM ((titles JOIN sales ON titles.title_id = sales.title_id)  JOIN stores ON sales.stor_id = stores.stor_id) WHERE stor_name = 'Bookbeat' 

--k
--SELECT au_fname,au_lname, COUNT(type) AS difType FROM ((authors JOIN titleauthor ON authors.au_id = titleauthor.au_id) JOIN titles ON titleauthor.title_id = titles.title_id) GROUP BY au_fname,au_lname HAVING COUNT(type) > 1

--l
--SELECT type, pub_id, AVG(price) AS avgPrice FROM titles GROUP BY type, pub_id

--m
--SELECT type FROM titles GROUP BY type HAVING MAX(advance) > 1.5 * AVG(advance)

--n
--SELECT DISTINCT title, au_fname, au_lname,  royalty*price*ytd_sales/100 AS auths_revenue FROM ((authors JOIN titleauthor ON authors.au_id = authors.au_id) JOIN titles ON titleauthor.title_id = titles.title_id) 

--o
--SELECT DISTINCT title, ytd_sales, ytd_sales*price AS facturacao, royalty*price*ytd_sales/100 AS auths_revenue, (ytd_sales*price) - (royalty*price*ytd_sales/100) AS publisher_revenue FROM (titleauthor JOIN titles ON titleauthor.title_id = titles.title_id) WHERE titles.ytd_sales IS NOT NULL

--p
--SELECT DISTINCT title, ytd_sales, au_fname + ' ' + au_lname AS author, royalty*price*ytd_sales/100 AS auth_revenue, (ytd_sales*price) - (royalty*price*ytd_sales/100) AS publisher_revenue FROM ((authors JOIN titleauthor ON authors.au_id = titleauthor.au_id) JOIN titles ON titleauthor.title_id = titles.title_id) WHERE titles.ytd_sales IS NOT NULL

--q
--SELECT stores.stor_id, stores.stor_name FROM ((stores JOIN sales ON stores.stor_id=sales.stor_id) JOIN titles ON sales.title_id=titles.title_id) GROUP BY stores.stor_id, stores.stor_name HAVING COUNT(titles.title_id) >= (SELECT COUNT(*) FROM titles);

--r
--SELECT stores.stor_id, stores.stor_name FROM stores JOIN sales ON stores.stor_id=sales.stor_id GROUP BY stores.stor_id, stores.stor_name HAVING SUM(qty) > (SELECT AVG(total_sales) FROM( SELECT stor_name, SUM(qty) AS total_sales (FROM stores JOIN sales ON stores.stor_id=sales.stor_id) GROUP BY stores.stor_id, stores.stor_name) AS stor_sales);

--s
--SELECT title, stor_name FROM ((stores JOIN sales ON stores.stor_id = sales.stor_id) JOIN titles ON titles.title_id = sales.title_id) WHERE stores.stor_name <> 'Bookbeat'

--t
--SELECT pub_name, stor_id FROM stores, publishers EXCEPT SELECT pub_name, stores.stor_id (((FROM stores JOIN sales ON stores.stor_id=sales.stor_id)JOIN titles ON sales.title_id=titles.title_id) JOIN publishers ON titles.pub_id=publishers.pub_id) GROUP BY pub_name, stores.stor_id;