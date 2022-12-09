
CREATE TABLE tracking_infos (
    id INT DEFAULT null PRIMARY KEY,
    curier CHARACTER VARYING(20) NOT NULL,
    status CHARACTER VARYING(20) NOT NULL,
    exp_delivery_date DATE NOT NULL,
    FOREIGN KEY (id) REFERENCES orders (id) 
);
