CREATE TABLE is_genre (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    genre_name TEXT NOT NULL,
    book_isbn TEXT NOT NULL
);
