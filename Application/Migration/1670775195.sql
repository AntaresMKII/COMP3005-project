CREATE TABLE ordered (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    book_id UUID NOT NULL,
    order_id UUID NOT NULL,
    amount INT NOT NULL
);
ALTER TABLE ordered ADD CONSTRAINT ordered_id_key UNIQUE(id);
CREATE INDEX ordered_book_id_index ON ordered (book_id);
CREATE INDEX ordered_order_id_index ON ordered (order_id);
ALTER TABLE ordered ADD CONSTRAINT ordered_ref_book_id FOREIGN KEY (book_id) REFERENCES books (id) ON DELETE NO ACTION;
ALTER TABLE ordered ADD CONSTRAINT ordered_ref_order_id FOREIGN KEY (order_id) REFERENCES orders (id) ON DELETE NO ACTION;
