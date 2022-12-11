ALTER TABLE authors ADD CONSTRAINT authors_id_key UNIQUE(id);
ALTER TABLE publishers ADD CONSTRAINT publishers_id_key UNIQUE(id);
ALTER TABLE books ADD CONSTRAINT books_id_key UNIQUE(id);
ALTER TABLE users ADD CONSTRAINT users_id_key UNIQUE(id);
ALTER TABLE orders ADD CONSTRAINT orders_id_key UNIQUE(id);
