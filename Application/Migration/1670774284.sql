CREATE TABLE publishers (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    email TEXT NOT NULL,
    name TEXT NOT NULL,
    address TEXT NOT NULL,
    bank_account TEXT NOT NULL
);
