CREATE TABLE authors (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    bio TEXT NOT NULL,
    nationality TEXT NOT NULL,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL,
    dob DATE NOT NULL
);
