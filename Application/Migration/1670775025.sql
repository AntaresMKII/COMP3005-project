ALTER TABLE is_genre DROP COLUMN genre_name;
ALTER TABLE is_genre DROP COLUMN book_isbn;
ALTER TABLE is_genre ADD COLUMN genre_id UUID NOT NULL;
ALTER TABLE is_genre ADD COLUMN book_id UUID NOT NULL;
CREATE TABLE wrote (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    author_id UUID NOT NULL,
    book_id UUID NOT NULL
);
CREATE INDEX wrote_author_id_index ON wrote (author_id);
CREATE INDEX wrote_book_id_index ON wrote (book_id);
CREATE INDEX is_genre_genre_id_index ON is_genre (genre_id);
CREATE INDEX is_genre_book_id_index ON is_genre (book_id);
ALTER TABLE is_genre ADD CONSTRAINT is_genre_ref_book_id FOREIGN KEY (book_id) REFERENCES books (id) ON DELETE NO ACTION;
ALTER TABLE is_genre ADD CONSTRAINT is_genre_ref_genre_id FOREIGN KEY (genre_id) REFERENCES genres (id) ON DELETE NO ACTION;
ALTER TABLE wrote ADD CONSTRAINT wrote_ref_author_id FOREIGN KEY (author_id) REFERENCES authors (id) ON DELETE NO ACTION;
ALTER TABLE wrote ADD CONSTRAINT wrote_ref_book_id FOREIGN KEY (book_id) REFERENCES books (id) ON DELETE NO ACTION;
