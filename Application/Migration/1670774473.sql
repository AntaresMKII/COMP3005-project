CREATE TABLE users (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    email TEXT NOT NULL,
    lname TEXT NOT NULL,
    fname TEXT NOT NULL,
    "password" TEXT NOT NULL
);
ALTER TABLE users ADD CONSTRAINT users_email_key UNIQUE(email);
