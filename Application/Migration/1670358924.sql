
CREATE TABLE is_genre (
    name CHARACTER VARYING(20) DEFAULT null PRIMARY KEY,
    isbn CHARACTER VARYING(10) NOT NULL,
    FOREIGN KEY (name) REFERENCES genres (name) ,
    FOREIGN KEY (isbn) REFERENCES books (isbn) 
);
