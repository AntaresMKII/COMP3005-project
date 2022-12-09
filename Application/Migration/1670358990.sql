
CREATE TABLE in_basket (
    email CHARACTER VARYING(20) DEFAULT null PRIMARY KEY,
    isbn CHARACTER VARYING(10) NOT NULL,
    amount INT NOT NULL,
    FOREIGN KEY (email) REFERENCES checkout_baskets (email) ,
    FOREIGN KEY (isbn) REFERENCES books (isbn) 
);
ALTER TABLE in_basket ADD CONSTRAINT in_basket_isbn_key UNIQUE(isbn);
