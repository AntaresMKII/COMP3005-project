ALTER TABLE genres ADD CONSTRAINT genres_id_key UNIQUE(id);
ALTER TABLE authors ADD CONSTRAINT authors_id_key UNIQUE(id);
ALTER TABLE publishers ADD CONSTRAINT publishers_id_key UNIQUE(id);
ALTER TABLE books ADD CONSTRAINT books_id_key UNIQUE(id);
ALTER TABLE users ADD CONSTRAINT users_id_key UNIQUE(id);
ALTER TABLE checkout_baskets ADD CONSTRAINT checkout_baskets_id_key UNIQUE(id);
ALTER TABLE orders ADD CONSTRAINT orders_id_key UNIQUE(id);
ALTER TABLE ordered ADD CONSTRAINT ordered_id_key UNIQUE(id);
