CREATE TABLE billing_info (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    order_id UUID NOT NULL,
    address TEXT NOT NULL,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL,
    card_number TEXT NOT NULL,
    exp_date DATE NOT NULL
);
ALTER TABLE billing_info ADD CONSTRAINT billing_info_order_id_key UNIQUE(order_id);
CREATE INDEX billing_info_order_id_index ON billing_info (order_id);
ALTER TABLE billing_info ADD CONSTRAINT billing_info_ref_order_id FOREIGN KEY (order_id) REFERENCES orders (id) ON DELETE NO ACTION;
