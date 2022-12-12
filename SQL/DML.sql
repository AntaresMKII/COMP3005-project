-- Here is the default data inserted in the database
-- Genres
INSERT INTO public.genres (name, description)
VALUES ('Fantasy', 'Fantasy');

INSERT INTO public.genres (name, description)
VALUES ('Non Fiction', 'Real Topics');

-- Authors
INSERT INTO public.authors (bio, nationality, fname, lname, dob)
VALUES ('Patrick James Rothfuss is an American author. He is best known for his projected trilogy The Kingkiller Chronicle.', 'American', 'Patrick', 'Rothfuss', '1973-06-06');

INSERT INTO public.authors (bio, nationality, fname, lname, dob)
VALUES ('An independent political analyst and writer', 'Canadian', 'Stephen', 'Gowans', '1950-02-05');

-- Publishers
INSERT INTO public.publishers (email, name, address, bank_account)
VALUES ('info@ballantine.com', 'Ballantine Books', ' ', '12345-678-901-234-5');

INSERT INTO public.publishers (email, name, address, bank_account)
VALUES ('info@dawbooks.com', 'DAW Book', '23 Somewhere Street', '09823-435-923-5');

INSERT INTO public.publishers (email, name, address, bank_account)
VALUES ('info@barakabooks.com', 'Baraka Book', '7834 Foo Street', '09345-368-124-5');

-- Books
INSERT INTO public.books (isbn, n_pages, summary, price, title, release_date, in_stock, publisher_percentage, publisher_id)
VALUES (
    '0345336275',
    285,
    'The Galactic Empire has lasted for 12,000 years and ruled over a million planets...',
    5.99,
    'Foundation',
    '1983-03-01',
    23,
    12,
    'bb148396-9c49-4aa5-a2d1-dd2b3ff02fb5'
);

UPDATE public.books
SET publisher_id = (
    SELECT id FROM public.publishers
    WHERE public.publishers.email = 'info@ballantine.com'
)
WHERE public.books.isbn = '0345336275';

INSERT INTO public.books (isbn, n_pages, summary, price, title, release_date, in_stock, publisher_percentage, publisher_id)
VALUES (
    '9780756405892',
    662,
    'My name is Kvothe. I have stolen princesses back from sleeping barrow kings.',
    20.99,
    'The Name of the Wind',
    '2009-04-01',
    55,
    25,
    'bb148396-9c49-4aa5-a2d1-dd2b3ff02fb5'
);

UPDATE public.books
SET publisher_id = (
    SELECT id FROM public.publishers
    WHERE public.publishers.email = 'info@dawbooks.com'
)
WHERE public.books.isbn = '9780756405892';

INSERT INTO public.books (isbn, n_pages, summary, price, title, release_date, in_stock, publisher_percentage, publisher_id)
VALUES (
    '9780756407124',
    1000,
    '',
    25.00,
    'The Wise Mans Fear',
    '2012-03-01',
    57,
    25,
    'bb148396-9c49-4aa5-a2d1-dd2b3ff02fb5'
);

UPDATE public.books
SET publisher_id = (
    SELECT id FROM public.publishers
    WHERE public.publishers.email = 'info@dawbooks.com'
)
WHERE public.books.isbn = '9780756407124';

INSERT INTO public.books (isbn, n_pages, summary, price, title, release_date, in_stock, publisher_percentage, publisher_id)
VALUES (
    '9781771862745',
    266,
    'The pandemic will end "when th world chooses to end it," said the WHO in summer 2021.',
    24.95,
    'The Killers Henchman',
    '2022-01-01',
    100,
    20,
    'bb148396-9c49-4aa5-a2d1-dd2b3ff02fb5'
);

UPDATE public.books
SET publisher_id = (
    SELECT id FROM public.publishers
    WHERE public.publishers.email = 'info@barakabooks.com'
)
WHERE public.books.isbn = '9781771862745';

-- wrote
INSERT INTO public.wrote (book_id, author_id)
SELECT public.books.id, public.authors.id FROM public.books, public.authors
WHERE public.books.isbn = '0345336275' AND public.authors.lname = 'Asimov';

INSERT INTO public.wrote (book_id, author_id)
SELECT public.books.id, public.authors.id FROM public.books, public.authors
WHERE public.books.isbn = '9780756405892' AND public.authors.lname = 'Rothfuss';

INSERT INTO public.wrote (book_id, author_id)
SELECT public.books.id, public.authors.id FROM public.books, public.authors
WHERE public.books.isbn = '9780756407124' AND public.authors.lname = 'Rothfuss';

INSERT INTO public.wrote (book_id, author_id)
SELECT public.books.id, public.authors.id FROM public.books, public.authors
WHERE public.books.isbn = '9781771862745' AND public.authors.lname = 'Gowans';

-- is genre
INSERT INTO public.is_genre (book_id, genre_id)
SELECT public.books.id, public.genres.id FROM public.books, public.genres
WHERE public.books.isbn = '0345336275' AND public.genres.name = 'Sci-fi';

INSERT INTO public.is_genre (book_id, genre_id)
SELECT public.books.id, public.genres.id FROM public.books, public.genres
WHERE public.books.isbn = '9780756405892' AND public.genres.name = 'Fantasy';

INSERT INTO public.is_genre (book_id, genre_id)
SELECT public.books.id, public.genres.id FROM public.books, public.genres
WHERE public.books.isbn = '9780756407124' AND public.genres.name = 'Fantasy';

INSERT INTO public.is_genre (book_id, genre_id)
SELECT public.books.id, public.genres.id FROM public.books, public.genres
WHERE public.books.isbn = '97801771862745' AND public.genres.name = 'Non Fiction';
