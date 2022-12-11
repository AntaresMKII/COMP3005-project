ALTER TABLE books ADD COLUMN publisher_id UUID NOT NULL;
ALTER TABLE publishers ADD CONSTRAINT publishers_id_key UNIQUE(id);
CREATE INDEX books_publisher_id_index ON books (publisher_id);
ALTER TABLE books ADD CONSTRAINT books_ref_publisher_id FOREIGN KEY (publisher_id) REFERENCES publishers (id) ON DELETE NO ACTION;
