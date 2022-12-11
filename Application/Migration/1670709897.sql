CREATE TABLE books (
    id UUID DEFAULT uuid_generate_v4() NOT NULL,
    isbn TEXT NOT NULL,
    n_pages INT NOT NULL,
    summary TEXT NOT NULL,
    price INT NOT NULL,
    title TEXT NOT NULL,
    release_date TEXT NOT NULL,
    in_stock INT NOT NULL,
    publisher_percentage INT NOT NULL,
    publisher_id UUID NOT NULL,
    PRIMARY KEY(id, isbn)
);
ALTER TABLE books ADD CONSTRAINT books_isbn_key UNIQUE(isbn);
CREATE INDEX books_publisher_id_index ON books (publisher_id);
ALTER TABLE books ADD CONSTRAINT books_ref_publisher_id FOREIGN KEY (publisher_id) REFERENCES publishers (id) ON DELETE NO ACTION;
