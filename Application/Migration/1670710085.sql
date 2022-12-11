CREATE TABLE users (
    id UUID DEFAULT uuid_generate_v4() NOT NULL,
    email TEXT NOT NULL,
    lname TEXT NOT NULL,
    fname TEXT NOT NULL,
    "password" TEXT NOT NULL,
    PRIMARY KEY(id, email)
);
ALTER TABLE users ADD CONSTRAINT users_id_key UNIQUE(id);
ALTER TABLE users ADD CONSTRAINT users_email_key UNIQUE(email);
