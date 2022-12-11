CREATE TABLE orders (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    date DATE NOT NULL,
    user_id UUID NOT NULL
);
ALTER TABLE orders ADD CONSTRAINT orders_id_key UNIQUE(id);
CREATE INDEX orders_user_id_index ON orders (user_id);
ALTER TABLE orders ADD CONSTRAINT orders_ref_user_id FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE NO ACTION;
