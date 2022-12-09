
CREATE TABLE checkout_baskets (
    email CHARACTER VARYING(50) DEFAULT null PRIMARY KEY,
    FOREIGN KEY (email) REFERENCES users (email) 
);
