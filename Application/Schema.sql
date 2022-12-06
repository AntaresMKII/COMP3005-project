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

CREATE TABLE users (
    email VARCHAR(50) PRIMARY KEY,
    lname VARCHAR(20) NOT NULL,
    fname VARCHAR(20) NOT NULL
);

CREATE TABLE checkout_baskets (
    email VARCHAR(50) PRIMARY KEY,
    FOREIGN KEY (email)
        REFERENCES users (email)
);

CREATE TABLE orders (
    number INT PRIMARY KEY,
    order_date DATE NOT NULL,
    email VARCHAR(50) NOT NULL,
    FOREIGN KEY (email)
        REFERENCES users (email)
);

CREATE TABLE billing_infos (
    order_number INT PRIMARY KEY,
    address VARCHAR(50) NOT NULL,
    fname VARCHAR(20) NOT NULL,
    lname VARCHAR(20) NOT NULL,
    card_number CHAR(16) NOT NULL,
    exp_date DATE NOT NULL,
    cvv CHAR(3) NOT NULL,
    FOREIGN KEY (order_number)
        REFERENCES orders (number)
);

CREATE TABLE shipping_infos (
    order_number INT PRIMARY KEY,
    address VARCHAR(50) NOT NULL,
    fname VARCHAR(20) NOT NULL,
    lname VARCHAR(20) NOT NULL,
    FOREIGN KEY (order_number)
        REFERENCES orders (number)
);

CREATE TABLE tracking_infos (
    order_number INT PRIMARY KEY,
    curier VARCHAR(20) NOT NULL,
    status VARCHAR(20) NOT NULL,
    exp_delivery_date DATE NOT NULL,
    FOREIGN KEY (order_number)
        REFERENCES orders (number)
);

CREATE TABLE is_genre (
    genre_name VARCHAR(20) PRIMARY KEY,
    isbn VARCHAR(10) PRIMARY KEY,
    FOREIGN KEY (genre_name)
        REFERENCES genre (name),
    FOREIGN KEY (isbn)
        REFERENCES books (isbn)
);
