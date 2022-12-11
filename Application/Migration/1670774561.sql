CREATE TABLE checkout_baskets (
    id UUID DEFAULT uuid_generate_v4() NOT NULL,
    user_id UUID NOT NULL
);
ALTER TABLE checkout_baskets ADD CONSTRAINT checkout_baskets_user_id_key UNIQUE(user_id);
CREATE INDEX checkout_baskets_user_id_index ON checkout_baskets (user_id);
ALTER TABLE checkout_baskets ADD CONSTRAINT checkout_baskets_ref_user_id FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE NO ACTION;
