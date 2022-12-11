CREATE TABLE publishers (
    id UUID DEFAULT uuid_generate_v4() NOT NULL,
    email TEXT NOT NULL,
    name TEXT NOT NULL,
    address TEXT NOT NULL,
    bank_account TEXT NOT NULL,
    PRIMARY KEY(id, email)
);
ALTER TABLE publishers ADD CONSTRAINT publishers_email_key UNIQUE(email);
