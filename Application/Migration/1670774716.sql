CREATE TABLE tracking_infos (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    order_id UUID NOT NULL,
    curier TEXT NOT NULL,
    status TEXT NOT NULL,
    expected_delivery_date DATE NOT NULL
);
ALTER TABLE tracking_infos ADD CONSTRAINT tracking_infos_order_id_key UNIQUE(order_id);
CREATE INDEX tracking_infos_order_id_index ON tracking_infos (order_id);
ALTER TABLE tracking_infos ADD CONSTRAINT tracking_infos_ref_order_id FOREIGN KEY (order_id) REFERENCES orders (id) ON DELETE NO ACTION;
