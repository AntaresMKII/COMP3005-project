CREATE TABLE genres (
    name CHARACTER VARYING(20) DEFAULT null PRIMARY KEY,
    description CHARACTER VARYING(100) DEFAULT null
);
CREATE TABLE authors (
    id INT DEFAULT null PRIMARY KEY,
    bio CHARACTER VARYING(100) DEFAULT null,
    nationality CHARACTER VARYING(20) NOT NULL,
    fname CHARACTER VARYING(20) NOT NULL,
    lname CHARACTER VARYING(20) NOT NULL,
    dob DATE NOT NULL
);
CREATE TABLE publishers (
    email CHARACTER VARYING(20) DEFAULT null PRIMARY KEY,
    name CHARACTER VARYING(50) NOT NULL,
    address CHARACTER VARYING(50) DEFAULT null,
    bank_account CHARACTER VARYING(20) NOT NULL
);
CREATE TABLE books (
    isbn CHARACTER VARYING(10) DEFAULT null PRIMARY KEY,
    n_pages INT NOT NULL,
    summary CHARACTER VARYING(100) DEFAULT null,
    price NUMERIC(7,2) DEFAULT null,
    title CHARACTER VARYING(50) NOT NULL,
    release_date DATE DEFAULT null,
    in_stock INT NOT NULL,
    publisher_percentage INT NOT NULL,
    p_email CHARACTER VARYING(20) NOT NULL,
    FOREIGN KEY (p_email) REFERENCES publishers (email) 
);
CREATE TABLE users (
    email CHARACTER VARYING(50) DEFAULT null PRIMARY KEY,
    lname CHARACTER VARYING(20) NOT NULL,
    fname CHARACTER VARYING(20) NOT NULL
);
CREATE TABLE checkout_baskets (
    email CHARACTER VARYING(50) DEFAULT null PRIMARY KEY,
    FOREIGN KEY (email) REFERENCES users (email) 
);
CREATE TABLE orders (
    number INT DEFAULT null PRIMARY KEY,
    order_date DATE NOT NULL,
    email CHARACTER VARYING(50) NOT NULL,
    FOREIGN KEY (email) REFERENCES users (email) 
);
CREATE TABLE billing_infos (
    order_number INT DEFAULT null PRIMARY KEY,
    address CHARACTER VARYING(50) NOT NULL,
    fname CHARACTER VARYING(20) NOT NULL,
    lname CHARACTER VARYING(20) NOT NULL,
    card_number CHARACTER(16) NOT NULL,
    exp_date DATE NOT NULL,
    cvv CHARACTER(3) NOT NULL,
    FOREIGN KEY (order_number) REFERENCES orders (number) 
);
CREATE TABLE shipping_infos (
    order_number INT DEFAULT null PRIMARY KEY,
    address CHARACTER VARYING(50) NOT NULL,
    fname CHARACTER VARYING(20) NOT NULL,
    lname CHARACTER VARYING(20) NOT NULL,
    FOREIGN KEY (order_number) REFERENCES orders (number) 
);
CREATE TABLE tracking_infos (
    order_number INT DEFAULT null PRIMARY KEY,
    curier CHARACTER VARYING(20) NOT NULL,
    status CHARACTER VARYING(20) NOT NULL,
    exp_delivery_date DATE NOT NULL,
    FOREIGN KEY (order_number) REFERENCES orders (number) 
);
CREATE TABLE is_genre (
    genre_name CHARACTER VARYING(20) DEFAULT null PRIMARY KEY,
    isbn CHARACTER VARYING(10) NOT NULL,
    FOREIGN KEY (genre_name) REFERENCES genres (name) ,
    FOREIGN KEY (isbn) REFERENCES books (isbn) 
);
CREATE TABLE wrote (
    aid INT DEFAULT null PRIMARY KEY,
    isbn CHARACTER VARYING(10) NOT NULL,
    FOREIGN KEY (aid) REFERENCES authors (id) ,
    FOREIGN KEY (isbn) REFERENCES books (isbn) 
);
CREATE TABLE in_basket (
    email CHARACTER VARYING(20) DEFAULT null PRIMARY KEY,
    isbn CHARACTER VARYING(10) NOT NULL,
    amount INT NOT NULL,
    FOREIGN KEY (email) REFERENCES checkout_baskets (email) ,
    FOREIGN KEY (isbn) REFERENCES books (isbn) 
);
ALTER TABLE in_basket ADD CONSTRAINT in_basket_isbn_key UNIQUE(isbn);
CREATE TABLE ordered (
    isbn CHARACTER VARYING(10) DEFAULT null PRIMARY KEY,
    order_number INT NOT NULL,
    amount INT NOT NULL,
    FOREIGN KEY (isbn) REFERENCES books (isbn) ,
    FOREIGN KEY (order_number) REFERENCES orders (number) 
);
