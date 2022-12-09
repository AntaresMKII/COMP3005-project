
CREATE TABLE billing_infos (
    id INT DEFAULT null PRIMARY KEY,
    address CHARACTER VARYING(50) NOT NULL,
    fname CHARACTER VARYING(20) NOT NULL,
    lname CHARACTER VARYING(20) NOT NULL,
    card_number CHARACTER(16) NOT NULL,
    exp_date DATE NOT NULL,
    cvv CHARACTER(3) NOT NULL,
    FOREIGN KEY (order_number) REFERENCES orders (order_number) 
);
