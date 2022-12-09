CREATE TABLE genres (
    name CHARACTER VARYING(20) PRIMARY KEY,
    description CHARACTER VARYING(100)
);
CREATE TABLE authors (
    id INT PRIMARY KEY,
    bio CHARACTER VARYING(250),
    nationality CHARACTER VARYING(20) NOT NULL,
    fname CHARACTER VARYING(20) NOT NULL,
    lname CHARACTER VARYING(20) NOT NULL,
    dob DATE NOT NULL
);
CREATE TABLE publishers (
    email CHARACTER VARYING(20) PRIMARY KEY,
    name CHARACTER VARYING(50) NOT NULL,
    address CHARACTER VARYING(50),
    bank_account CHARACTER VARYING(20) NOT NULL
);
CREATE TABLE books (
    isbn TEXT DEFAULT NULL PRIMARY KEY,
    n_pages INT NOT NULL,
    summary CHARACTER VARYING(100),
    price NUMERIC(7,2),
    title CHARACTER VARYING(50) NOT NULL,
    release_date DATE,
    in_stock INT NOT NULL,
    publisher_percentage INT NOT NULL,
    p_email CHARACTER VARYING(20) NOT NULL,
    FOREIGN KEY (p_email) REFERENCES publishers (email) 
);
CREATE TABLE users (
    email CHARACTER VARYING(50) PRIMARY KEY,
    lname CHARACTER VARYING(20) NOT NULL,
    fname CHARACTER VARYING(20) NOT NULL
);
CREATE TABLE checkout_baskets (
    email CHARACTER VARYING(50) PRIMARY KEY,
    FOREIGN KEY (email) REFERENCES users (email) 
);
CREATE TABLE orders (
    id INT PRIMARY KEY,
    order_date DATE NOT NULL,
    email CHARACTER VARYING(50) NOT NULL,
    FOREIGN KEY (email) REFERENCES users (email) 
);
CREATE TABLE billing_infos (
    id INT PRIMARY KEY,
    address CHARACTER VARYING(50) NOT NULL,
    fname CHARACTER VARYING(20) NOT NULL,
    lname CHARACTER VARYING(20) NOT NULL,
    card_number CHARACTER(16) NOT NULL,
    exp_date DATE NOT NULL,
    cvv CHARACTER(3) NOT NULL,
    FOREIGN KEY (id) REFERENCES orders (id) 
);
CREATE TABLE shipping_infos (
    id INT PRIMARY KEY,
    address CHARACTER VARYING(50) NOT NULL,
    fname CHARACTER VARYING(20) NOT NULL,
    lname CHARACTER VARYING(20) NOT NULL,
    FOREIGN KEY (id) REFERENCES orders (id) 
);
CREATE TABLE tracking_infos (
    id INT PRIMARY KEY,
    curier CHARACTER VARYING(20) NOT NULL,
    status CHARACTER VARYING(20) NOT NULL,
    exp_delivery_date DATE NOT NULL,
    FOREIGN KEY (id) REFERENCES orders (id) 
);
CREATE TABLE is_genre (
    name CHARACTER VARYING(20) PRIMARY KEY,
    isbn CHARACTER VARYING(10) NOT NULL,
    FOREIGN KEY (name) REFERENCES genres (name) ,
    FOREIGN KEY (isbn) REFERENCES books (isbn) 
);
CREATE TABLE wrote (
    aid INT PRIMARY KEY,
    isbn CHARACTER VARYING(10) NOT NULL,
    FOREIGN KEY (aid) REFERENCES authors (id) ,
    FOREIGN KEY (isbn) REFERENCES books (isbn) 
);
CREATE TABLE in_basket (
    email CHARACTER VARYING(20) PRIMARY KEY,
    isbn CHARACTER VARYING(10) NOT NULL UNIQUE,
    amount INT NOT NULL,
    FOREIGN KEY (email) REFERENCES checkout_baskets (email) ,
    FOREIGN KEY (isbn) REFERENCES books (isbn) 
);
CREATE TABLE ordered (
    isbn CHARACTER VARYING(10) PRIMARY KEY,
    onum INT NOT NULL,
    amount INT NOT NULL,
    FOREIGN KEY (isbn) REFERENCES books (isbn) ,
    FOREIGN KEY (onum) REFERENCES orders (id) 
);
