-- Your database schema. Use the Schema Designer at http://localhost:8001/ to add some tables.

CREATE TABLE genres (
    name VARCHAR(20) PRIMARY KEY,
    description VARCHAR(100)
);

CREATE TABLE authors (
    id INT PRIMARY KEY,
    bio VARCHAR(100),
    nationality VARCHAR(20) NOT NULL,
    fname VARCHAR(20) NOT NULL,
    lname VARCHAR(20) NOT NULL,
    dob DATE NOT NULL
);

CREATE TABLE publishers (
    email VARCHAR(20) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(50),
    bank_account VARCHAR(20) NOT NULL
);

CREATE TABLE books (
    isbn VARCHAR(10) PRIMARY KEY,
    n_pages INT NOT NULL,
    summary VARCHAR(100),
    price NUMERIC(7,2),
    title VARCHAR(50) NOT NULL,
    release_date DATE,
    in_stock INT NOT NULL,
    publisher_percentage INT NOT NULL,
    p_email VARCHAR(20) NOT NULL,
    FOREIGN KEY (p_email)
        REFERENCES publishers (email)
);
