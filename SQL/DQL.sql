-- Here are the queries used in the application

SELECT books.id, authors.fname, authors.lname, books.title, books.price
FROM books, wrote, authors
WHERE books.id = wrote.book_id AND 
    authors.id = wrote.author_id;

SELECT
    books.id,
    books.isbn,
    books.n_pages,
    books.summary,
    books.price,
    books.title,
    books.release_date,
    books.in_stock,
    books.publisher_percentage, 
    genres.name AS genre_name,
    authors.fname AS author_fname,
    authors.lname AS author_lname,
    publishers.email AS publisher_email,
    publishers.name AS publisher_name,
    publishers.address AS publisher_address
FROM 
    books,
    genres,
    authors,
    publishers,
    wrote,
    is_genre
WHERE 
    books.publisher_id = publishers.id AND
    books.id = is_genre.book_id AND
    genres.id = is_genre.genre_id AND
    wrote.book_id = books.id AND 
    wrote.author_id = authors.id AND
    books.id = ?; -- NOTE: ? is used by IHP to indicate where to put an argument
