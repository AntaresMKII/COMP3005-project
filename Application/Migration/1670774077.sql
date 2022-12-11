CREATE TABLE genres (
    name TEXT NOT NULL,
    description TEXT NOT NULL
);
ALTER TABLE genres ADD CONSTRAINT genres_name_key UNIQUE(name);
