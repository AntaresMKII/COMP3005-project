
CREATE TABLE orders (
    id INT DEFAULT null PRIMARY KEY,
    order_date DATE NOT NULL,
    email CHARACTER VARYING(50) NOT NULL,
    FOREIGN KEY (email) REFERENCES users (email) 
);
