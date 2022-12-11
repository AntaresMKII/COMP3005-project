CREATE TABLE in_basket (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    book_id UUID NOT NULL,
    checkout_basket_id UUID NOT NULL,
    amount INT NOT NULL
);
ALTER TABLE in_basket ADD CONSTRAINT in_basket_checkout_basket_id_key UNIQUE(checkout_basket_id);
CREATE INDEX in_basket_book_id_index ON in_basket (book_id);
CREATE INDEX in_basket_checkout_basket_id_index ON in_basket (checkout_basket_id);
ALTER TABLE in_basket ADD CONSTRAINT in_basket_ref_book_id FOREIGN KEY (book_id) REFERENCES books (id) ON DELETE NO ACTION;
ALTER TABLE in_basket ADD CONSTRAINT in_basket_ref_checkout_basket_id FOREIGN KEY (checkout_basket_id) REFERENCES checkout_baskets (id) ON DELETE NO ACTION;
