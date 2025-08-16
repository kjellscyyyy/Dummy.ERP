-- Categories 
CREATE TABLE categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

-- Products 
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    category_id INT,
    name VARCHAR(150) NOT NULL,
    undertone VARCHAR(50),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- Inventory 
CREATE TABLE inventory (
    inventory_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    stock_box INT,
    warehouse_location VARCHAR(50),
    last_update DATE,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert ke Categories
INSERT INTO categories (name) VALUES
('Lip Products'),
('Base Makeup'),
('Setting Spray'),
('Cheek Products'),
('Eye Products');

-- Insert ke Products 
-- Lip Matte (category_id = 1)
INSERT INTO products (category_id, name, undertone) VALUES
(1, 'Lip Matte - Crimson Flame', 'cool'),
(1, 'Lip Matte - Dusty Rose', 'medium'),
(1, 'Lip Matte - Maple Syrup', 'tan'),
(1, 'Lip Gloss - Crystal Shine', 'universal'),
(1, 'Lip Liner - Redwood', 'cool/tan'),
(1, 'Lip Tint - Cherry Bomb', 'cool');

-- Cushion Matte (category_id = 2)
INSERT INTO products (category_id, name, undertone) VALUES
(2, 'Cushion Matte - Porcelain Cool', 'cool'),
(2, 'Cushion Matte - Beige Neutral', 'medium'),
(2, 'Cushion Matte - Warm Tan', 'tan');

-- Setting Spray (category_id = 3)
INSERT INTO products (category_id, name, undertone) VALUES
(3, 'Setting Spray - Stay Matte All Day', 'matte'),
(3, 'Setting Spray - Dew Boost Mist', 'glow');


-- Inventory 

INSERT INTO inventory (product_id, stock_box, warehouse_location, last_update) VALUES
(1, 20, 'Mercure', '2025-08-01'),
(2, 15, 'Socrates', '2025-08-01'),
(3, 25, 'Avicenna', '2025-08-02'),
(4, 10, 'Mercure', '2025-08-03'),
(5, 30, 'Socrates', '2025-08-04'),
(6, 18, 'Avicenna', '2025-08-04'),
(7, 12, 'Mercure', '2025-08-05'),
(8, 14, 'Socrates', '2025-08-06'),
(9, 22, 'Avicenna', '2025-08-06'),
(10, 17, 'Mercure', '2025-08-07');

-- Cek semua data produk
SELECT * FROM products;

-- Cek stok inventory
SELECT p.name, i.stock_box, i.warehouse_location, i.last_update
FROM inventory i
JOIN products p ON i.product_id = p.product_id;
