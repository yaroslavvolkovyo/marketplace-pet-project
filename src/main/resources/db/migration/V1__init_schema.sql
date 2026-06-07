CREATE TABLE buyers (
                        buyer_id BIGSERIAL PRIMARY KEY,
                        name VARCHAR(100) NOT NULL,
                        email VARCHAR(255) NOT NULL UNIQUE,
                        password VARCHAR(255) NOT NULL,
                        balance DECIMAL(10,2) NOT NULL DEFAULT 0.00 CHECK (balance >= 0)
);

CREATE TABLE sellers (
                         seller_id BIGSERIAL PRIMARY KEY,
                         name VARCHAR(100) NOT NULL,
                         email VARCHAR(255) NOT NULL UNIQUE,
                         password VARCHAR(255) NOT NULL,
                         balance DECIMAL(10,2) NOT NULL DEFAULT 0.00 CHECK (balance >= 0)
);

CREATE TABLE products (
                          product_id BIGSERIAL PRIMARY KEY,
                          name VARCHAR(100) NOT NULL,
                          description VARCHAR(500),
                          price DECIMAL(10,2) NOT NULL DEFAULT 0.00 CHECK (price >= 0),
                          seller_id BIGINT NOT NULL REFERENCES sellers(seller_id) ON DELETE RESTRICT
);

CREATE TABLE buckets (
                         bucket_id BIGSERIAL PRIMARY KEY,
                         buyer_id BIGINT NOT NULL UNIQUE REFERENCES buyers(buyer_id) ON DELETE RESTRICT
);

CREATE TABLE bucket_items (
                              bucket_item_id BIGSERIAL PRIMARY KEY,
                              bucket_id BIGINT NOT NULL REFERENCES buckets(bucket_id) ON DELETE CASCADE,
                              product_id BIGINT NOT NULL REFERENCES products(product_id) ON DELETE RESTRICT,
                              quantity INT NOT NULL CHECK (quantity > 0),
                              UNIQUE(bucket_id, product_id)
);

CREATE TABLE orders (
                        order_id BIGSERIAL PRIMARY KEY,
                        buyer_id BIGINT NOT NULL REFERENCES buyers(buyer_id) ON DELETE RESTRICT,
                        status VARCHAR(20) NOT NULL DEFAULT 'NEW' CHECK (status IN ('NEW', 'PAID', 'SHIPPED', 'DELIVERED', 'CANCELLED')),
                        total_price DECIMAL(10,2) NOT NULL CHECK (total_price >= 0),
                        created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE order_items (
                             order_item_id BIGSERIAL PRIMARY KEY,
                             order_id BIGINT NOT NULL REFERENCES orders(order_id) ON DELETE CASCADE,
                             product_id BIGINT NOT NULL REFERENCES products(product_id) ON DELETE RESTRICT,
                             quantity INT NOT NULL CHECK (quantity > 0),
                             price_at_moment DECIMAL(10,2) NOT NULL CHECK (price_at_moment >= 0)
);

CREATE TABLE reviews (
                         review_id BIGSERIAL PRIMARY KEY,
                         product_id BIGINT NOT NULL REFERENCES products(product_id) ON DELETE CASCADE,
                         buyer_id BIGINT NOT NULL REFERENCES buyers(buyer_id) ON DELETE RESTRICT,
                         title VARCHAR(100) NOT NULL,
                         description TEXT,
                         estimation INT NOT NULL CHECK (estimation BETWEEN 1 AND 5),
                         created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                         UNIQUE(product_id, buyer_id)
);

