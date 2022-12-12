-- Your database schema. Use the Schema Designer at http://localhost:8001/ to add some tables.
CREATE TABLE genres (
    name TEXT NOT NULL UNIQUE,
    description TEXT NOT NULL,
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL UNIQUE
);
CREATE TABLE authors (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL UNIQUE,
    bio TEXT NOT NULL,
    nationality TEXT NOT NULL,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL,
    dob DATE
);
CREATE TABLE publishers (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE,
    name TEXT NOT NULL,
    address TEXT NOT NULL,
    bank_account TEXT NOT NULL
);
CREATE TABLE books (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL UNIQUE,
    isbn TEXT NOT NULL UNIQUE,
    n_pages INT NOT NULL,
    summary TEXT NOT NULL,
    price REAL NOT NULL,
    title TEXT NOT NULL,
    release_date DATE NOT NULL,
    in_stock INT NOT NULL,
    publisher_percentage INT NOT NULL,
    publisher_id UUID NOT NULL
);
CREATE INDEX books_publisher_id_index ON books (publisher_id);
CREATE TABLE users (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE,
    lname TEXT NOT NULL,
    fname TEXT NOT NULL,
    "password" TEXT NOT NULL
);
CREATE TABLE checkout_baskets (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL UNIQUE,
    user_id UUID NOT NULL UNIQUE
);
CREATE INDEX checkout_baskets_user_id_index ON checkout_baskets (user_id);
CREATE TABLE orders (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL UNIQUE,
    date DATE NOT NULL,
    user_id UUID NOT NULL
);
CREATE INDEX orders_user_id_index ON orders (user_id);
CREATE TABLE tracking_infos (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    order_id UUID NOT NULL UNIQUE,
    curier TEXT NOT NULL,
    status TEXT NOT NULL,
    expected_delivery_date DATE NOT NULL
);
CREATE INDEX tracking_infos_order_id_index ON tracking_infos (order_id);
CREATE TABLE shipping_infos (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    order_id UUID NOT NULL UNIQUE,
    address TEXT NOT NULL,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);
CREATE INDEX shipping_infos_order_id_index ON shipping_infos (order_id);
CREATE TABLE billing_info (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    order_id UUID NOT NULL UNIQUE,
    address TEXT NOT NULL,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL,
    card_number TEXT NOT NULL,
    exp_date DATE NOT NULL
);
CREATE INDEX billing_info_order_id_index ON billing_info (order_id);
CREATE TABLE is_genre (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    genre_id UUID NOT NULL,
    book_id UUID NOT NULL
);
CREATE TABLE wrote (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    author_id UUID NOT NULL,
    book_id UUID NOT NULL
);
CREATE INDEX wrote_author_id_index ON wrote (author_id);
CREATE INDEX wrote_book_id_index ON wrote (book_id);
CREATE INDEX is_genre_genre_id_index ON is_genre (genre_id);
CREATE INDEX is_genre_book_id_index ON is_genre (book_id);
CREATE TABLE in_basket (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    book_id UUID NOT NULL,
    checkout_basket_id UUID NOT NULL,
    amount INT NOT NULL
);
CREATE INDEX in_basket_book_id_index ON in_basket (book_id);
CREATE INDEX in_basket_checkout_basket_id_index ON in_basket (checkout_basket_id);
CREATE TABLE ordered (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL UNIQUE,
    book_id UUID NOT NULL,
    order_id UUID NOT NULL,
    amount INT NOT NULL
);
CREATE INDEX ordered_book_id_index ON ordered (book_id);
CREATE INDEX ordered_order_id_index ON ordered (order_id);
ALTER TABLE billing_info ADD CONSTRAINT billing_info_ref_order_id FOREIGN KEY (order_id) REFERENCES orders (id) ON DELETE NO ACTION;
ALTER TABLE books ADD CONSTRAINT books_ref_publisher_id FOREIGN KEY (publisher_id) REFERENCES publishers (id) ON DELETE NO ACTION;
ALTER TABLE checkout_baskets ADD CONSTRAINT checkout_baskets_ref_user_id FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE NO ACTION;
ALTER TABLE in_basket ADD CONSTRAINT in_basket_ref_book_id FOREIGN KEY (book_id) REFERENCES books (id) ON DELETE NO ACTION;
ALTER TABLE in_basket ADD CONSTRAINT in_basket_ref_checkout_basket_id FOREIGN KEY (checkout_basket_id) REFERENCES checkout_baskets (id) ON DELETE NO ACTION;
ALTER TABLE is_genre ADD CONSTRAINT is_genre_ref_book_id FOREIGN KEY (book_id) REFERENCES books (id) ON DELETE NO ACTION;
ALTER TABLE is_genre ADD CONSTRAINT is_genre_ref_genre_id FOREIGN KEY (genre_id) REFERENCES genres (id) ON DELETE NO ACTION;
ALTER TABLE ordered ADD CONSTRAINT ordered_ref_book_id FOREIGN KEY (book_id) REFERENCES books (id) ON DELETE NO ACTION;
ALTER TABLE ordered ADD CONSTRAINT ordered_ref_order_id FOREIGN KEY (order_id) REFERENCES orders (id) ON DELETE NO ACTION;
ALTER TABLE orders ADD CONSTRAINT orders_ref_user_id FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE NO ACTION;
ALTER TABLE shipping_infos ADD CONSTRAINT shipping_infos_ref_order_id FOREIGN KEY (order_id) REFERENCES orders (id) ON DELETE NO ACTION;
ALTER TABLE tracking_infos ADD CONSTRAINT tracking_infos_ref_order_id FOREIGN KEY (order_id) REFERENCES orders (id) ON DELETE NO ACTION;
ALTER TABLE wrote ADD CONSTRAINT wrote_ref_author_id FOREIGN KEY (author_id) REFERENCES authors (id) ON DELETE NO ACTION;
ALTER TABLE wrote ADD CONSTRAINT wrote_ref_book_id FOREIGN KEY (book_id) REFERENCES books (id) ON DELETE NO ACTION;
