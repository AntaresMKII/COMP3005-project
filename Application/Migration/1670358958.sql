
CREATE TABLE wrote (
    aid INT DEFAULT null PRIMARY KEY,
    isbn CHARACTER VARYING(10) NOT NULL,
    FOREIGN KEY (aid) REFERENCES authors (id) ,
    FOREIGN KEY (isbn) REFERENCES books (isbn) 
);
