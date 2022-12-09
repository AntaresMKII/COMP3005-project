
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
