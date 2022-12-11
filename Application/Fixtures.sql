-- Generated by IHP

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public.authors DISABLE TRIGGER ALL;

INSERT INTO public.authors (id, bio, nationality, fname, lname, dob) VALUES ('2a549a72-a892-44ba-a678-a3695048c0c1', 'American Author', 'American', 'Isaac', 'Asimov', '1920-01-02');


ALTER TABLE public.authors ENABLE TRIGGER ALL;


ALTER TABLE public.users DISABLE TRIGGER ALL;



ALTER TABLE public.users ENABLE TRIGGER ALL;


ALTER TABLE public.orders DISABLE TRIGGER ALL;



ALTER TABLE public.orders ENABLE TRIGGER ALL;


ALTER TABLE public.billing_info DISABLE TRIGGER ALL;



ALTER TABLE public.billing_info ENABLE TRIGGER ALL;


ALTER TABLE public.publishers DISABLE TRIGGER ALL;

INSERT INTO public.publishers (id, email, name, address, bank_account) VALUES ('3cc42bb4-07a3-4ef6-ab81-d222c2cd2cc5', 'info@bantam.com', 'Bantam Books', '123 ABC St', '123456789');


ALTER TABLE public.publishers ENABLE TRIGGER ALL;


ALTER TABLE public.books DISABLE TRIGGER ALL;

INSERT INTO public.books (id, isbn, n_pages, summary, price, title, release_date, in_stock, publisher_percentage, publisher_id) VALUES ('f2b1205e-7fda-4d4e-8a09-3c32fac74e04', '0553278398', 493, 'It is the year 12020 G.E. and Emperor Cleon I sits uneasily', 10.99, 'Prelude To Foundation', '1988-11-01', 20, 10, '3cc42bb4-07a3-4ef6-ab81-d222c2cd2cc5');


ALTER TABLE public.books ENABLE TRIGGER ALL;


ALTER TABLE public.checkout_baskets DISABLE TRIGGER ALL;



ALTER TABLE public.checkout_baskets ENABLE TRIGGER ALL;


ALTER TABLE public.genres DISABLE TRIGGER ALL;

INSERT INTO public.genres (name, description, id) VALUES ('Sci-fi', 'Science Fiction', '5dd356f5-e21e-4da9-aa71-5b2415fd309d');


ALTER TABLE public.genres ENABLE TRIGGER ALL;


ALTER TABLE public.in_basket DISABLE TRIGGER ALL;



ALTER TABLE public.in_basket ENABLE TRIGGER ALL;


ALTER TABLE public.is_genre DISABLE TRIGGER ALL;

INSERT INTO public.is_genre (id, genre_id, book_id) VALUES ('df727629-d593-4f94-8b54-42590ce37cb7', '5dd356f5-e21e-4da9-aa71-5b2415fd309d', 'f2b1205e-7fda-4d4e-8a09-3c32fac74e04');


ALTER TABLE public.is_genre ENABLE TRIGGER ALL;


ALTER TABLE public.ordered DISABLE TRIGGER ALL;



ALTER TABLE public.ordered ENABLE TRIGGER ALL;


ALTER TABLE public.schema_migrations DISABLE TRIGGER ALL;

INSERT INTO public.schema_migrations (revision) VALUES (1670709588);
INSERT INTO public.schema_migrations (revision) VALUES (1670709630);
INSERT INTO public.schema_migrations (revision) VALUES (1670709675);
INSERT INTO public.schema_migrations (revision) VALUES (1670709963);
INSERT INTO public.schema_migrations (revision) VALUES (1670710011);
INSERT INTO public.schema_migrations (revision) VALUES (1670710029);
INSERT INTO public.schema_migrations (revision) VALUES (1670710085);
INSERT INTO public.schema_migrations (revision) VALUES (1670710119);
INSERT INTO public.schema_migrations (revision) VALUES (1670710183);
INSERT INTO public.schema_migrations (revision) VALUES (1670710774);
INSERT INTO public.schema_migrations (revision) VALUES (1670774077);
INSERT INTO public.schema_migrations (revision) VALUES (1670774137);
INSERT INTO public.schema_migrations (revision) VALUES (1670774242);
INSERT INTO public.schema_migrations (revision) VALUES (1670774284);
INSERT INTO public.schema_migrations (revision) VALUES (1670774406);
INSERT INTO public.schema_migrations (revision) VALUES (1670774473);
INSERT INTO public.schema_migrations (revision) VALUES (1670774561);
INSERT INTO public.schema_migrations (revision) VALUES (1670774602);
INSERT INTO public.schema_migrations (revision) VALUES (1670774669);
INSERT INTO public.schema_migrations (revision) VALUES (1670774716);
INSERT INTO public.schema_migrations (revision) VALUES (1670774763);
INSERT INTO public.schema_migrations (revision) VALUES (1670774825);
INSERT INTO public.schema_migrations (revision) VALUES (1670774951);
INSERT INTO public.schema_migrations (revision) VALUES (1670775025);
INSERT INTO public.schema_migrations (revision) VALUES (1670775122);
INSERT INTO public.schema_migrations (revision) VALUES (1670775195);
INSERT INTO public.schema_migrations (revision) VALUES (1670775202);
INSERT INTO public.schema_migrations (revision) VALUES (1670775256);


ALTER TABLE public.schema_migrations ENABLE TRIGGER ALL;


ALTER TABLE public.shipping_infos DISABLE TRIGGER ALL;



ALTER TABLE public.shipping_infos ENABLE TRIGGER ALL;


ALTER TABLE public.tracking_infos DISABLE TRIGGER ALL;



ALTER TABLE public.tracking_infos ENABLE TRIGGER ALL;


ALTER TABLE public.wrote DISABLE TRIGGER ALL;

INSERT INTO public.wrote (id, author_id, book_id) VALUES ('ccd59cd5-b60e-4bda-a080-bf993d433314', '2a549a72-a892-44ba-a678-a3695048c0c1', 'f2b1205e-7fda-4d4e-8a09-3c32fac74e04');


ALTER TABLE public.wrote ENABLE TRIGGER ALL;

-- Manually Written
-- Genres

-- Authors

-- Publishers
ALTER TABLE public.publishers DISABLE TRIGGER ALL;

INSERT INTO public.publishers (email, name, address, bank_account)
VALUES ('info@ballantine.com', 'Ballantine Books', ' ', '12345-678-901-234-5');

ALTER TABLE public.publishers ENABLE TRIGGER ALL;

-- Books
ALTER TABLE public.books DISABLE TRIGGER ALL;

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
    '91cae89d-6ebb-4fbe-8a44-cff4b74c7feb'
);

ALTER TABLE public.publishers DISABLE TRIGGER ALL;

-- wrote
ALTER TABLE public.wrote DISABLE TRIGGER ALL;

INSERT INTO public.wrote (book_id, author_id)
SELECT public.books.id, public.authors.id FROM public.books, public.authors
WHERE public.books.isbn = '0345336275' AND public.authors.lname = 'Asimov';

ALTER TABLE public.wrote ENABLE TRIGGER ALL;
