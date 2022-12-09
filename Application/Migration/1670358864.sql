
CREATE TABLE shipping_infos (
    id INT DEFAULT null PRIMARY KEY,
    address CHARACTER VARYING(50) NOT NULL,
    fname CHARACTER VARYING(20) NOT NULL,
    lname CHARACTER VARYING(20) NOT NULL,
    FOREIGN KEY (id) REFERENCES orders (id) 
);