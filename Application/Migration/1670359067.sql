
CREATE TABLE ordered (
    isbn CHARACTER VARYING(10) DEFAULT null PRIMARY KEY,
    onum INT NOT NULL,
    amount INT NOT NULL,
    FOREIGN KEY (isbn) REFERENCES books (isbn) ,
    FOREIGN KEY (onum) REFERENCES orders (id) 
);
