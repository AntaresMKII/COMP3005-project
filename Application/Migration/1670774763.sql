CREATE TABLE shipping_infos (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    order_id UUID NOT NULL,
    address TEXT NOT NULL,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);
ALTER TABLE shipping_infos ADD CONSTRAINT shipping_infos_order_id_key UNIQUE(order_id);
CREATE INDEX shipping_infos_order_id_index ON shipping_infos (order_id);
ALTER TABLE shipping_infos ADD CONSTRAINT shipping_infos_ref_order_id FOREIGN KEY (order_id) REFERENCES orders (id) ON DELETE NO ACTION;
