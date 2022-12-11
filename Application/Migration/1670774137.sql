ALTER TABLE genres ADD COLUMN id UUID DEFAULT uuid_generate_v4() NOT NULL;
ALTER TABLE genres DROP CONSTRAINT genres_name_key;
ALTER TABLE genres ADD CONSTRAINT genres_id_key UNIQUE(id);
