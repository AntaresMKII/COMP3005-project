CREATE TABLE genres (
    id UUID DEFAULT uuid_generate_v4() NOT NULL,
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    PRIMARY KEY(id, name)
);
ALTER TABLE genres ADD CONSTRAINT genres_name_key UNIQUE(name);
