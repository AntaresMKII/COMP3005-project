ALTER TABLE genres ADD CONSTRAINT genres_name_key UNIQUE(name);
ALTER TABLE publishers ADD CONSTRAINT publishers_email_key UNIQUE(email);
CREATE TABLE books (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    isbn TEXT NOT NULL,
    n_pages INT NOT NULL,
    summary TEXT NOT NULL,
    price REAL NOT NULL,
    title TEXT NOT NULL,
    release_date DATE NOT NULL,
    in_stock INT NOT NULL,
    publisher_percentage INT NOT NULL,
    publisher_id UUID NOT NULL
);
ALTER TABLE books ADD CONSTRAINT books_isbn_key UNIQUE(isbn);
CREATE INDEX books_publisher_id_index ON books (publisher_id);
ALTER TABLE books ADD CONSTRAINT books_ref_publisher_id FOREIGN KEY (publisher_id) REFERENCES publishers (id) ON DELETE NO ACTION;
