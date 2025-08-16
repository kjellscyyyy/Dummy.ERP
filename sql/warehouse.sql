-- Kategori
CREATE TABLE dim_categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL
);

-- Produk
CREATE TABLE dim_products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(150) NOT NULL,
    category_id INT,
    undertone VARCHAR(50),
    FOREIGN KEY (category_id) REFERENCES dim_categories(category_id)
);

-- Gudang
CREATE TABLE dim_warehouse (
    warehouse_id INT PRIMARY KEY AUTO_INCREMENT,
    warehouse_location VARCHAR(50) NOT NULL
);

-- Fact table (stok gudang per produk)
CREATE TABLE fact_inventory (
    inventory_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    category_id INT,
    warehouse_id INT,
    stock_box INT,
    last_update DATE,
    FOREIGN KEY (product_id) REFERENCES dim_products(product_id),
    FOREIGN KEY (category_id) REFERENCES dim_categories(category_id),
    FOREIGN KEY (warehouse_id) REFERENCES dim_warehouse(warehouse_id)
);

-- Insert kategori
INSERT INTO dim_categories (category_name) VALUES
('Lip Matte'),
('Lip Gloss'),
('Lip Liner'),
('Lip Tint'),
('Cushion Matte'),
('Loose Powder'),
('Cushion Glow'),
('Setting Spray'),
('Blush'),
('Mascara'),
('Eyebrow Pencil');

-- Insert produk
INSERT INTO dim_products (product_name, category_id, undertone) VALUES
-- Lip Matte
('Crimson Flame', 1, 'cool'),
('Dusty Rose', 1, 'medium'),
('Maple Syrup', 1, 'tan'),
('Muted Coral', 1, 'cool'),
('Berry Rush', 1, 'olive'),
('Cinnamon Kiss', 1, 'medium'),
('Burnt Caramel', 1, 'tan'),
('Rose Clay', 1, 'cool'),
('Brick Nude', 1, 'olive'),
('Wine Plum', 1, 'tan'),

-- Lip Gloss
('Crystal Shine', 2, 'universal'),

-- Lip Liner
('Redwood', 3, 'cool/tan'),
('Blush Nude', 3, 'medium'),

-- Lip Tint
('Cherry Bomb', 4, 'cool'),
('Sunset Orange', 4, 'tan'),
('Pink Soda', 4, 'medium'),
('Berry Splash', 4, 'olive'),
('Grape Crush', 4, 'cool'),
('Peach Breeze', 4, 'medium'),
('Ruby Drop', 4, 'tan'),

-- Cushion Matte
('Porcelain Cool', 5, 'cool'),
('Beige Neutral', 5, 'medium'),
('Warm Tan', 5, 'tan'),
('Golden Olive', 5, 'olive'),
('Espresso', 5, 'deep/tan'),

-- Loose Powder
('Translucent Light', 6, 'cool'),
('Soft Beige', 6, 'medium'),
('Warm Honey', 6, 'tan/olive'),

-- Cushion Glow
('Ivory Radiance', 7, 'cool'),
('Nude Glow', 7, 'medium'),
('Sunlit Tan', 7, 'tan'),
('Amber Olive', 7, 'olive'),
('Deep Bronze', 7, 'deep skin'),

-- Setting Spray
('Stay Matte All Day', 8, 'matte'),
('Dew Boost Mist', 8, 'glow'),

-- Blush
('Peachy Pop', 9, 'cool'),
('Rosy Bloom', 9, 'medium'),
('Terracotta Dust', 9, 'tan/olive'),

-- Mascara
('Length Drama', 10, 'long lashes'),
('Mega Volume', 10, 'volume'),

-- Eyebrow Pencil
('Dark Brown', 11, 'brown'),
('Soft Black', 11, 'black');

-- Insert gudang
INSERT INTO dim_warehouse (warehouse_location) VALUES
('Mercure'),
('Socrates'),
('Avicenna');

-- Insert stok 
INSERT INTO fact_inventory (product_id, category_id, warehouse_id, stock_box, last_update)
SELECT p.product_id, p.category_id, 1, 120, '2025-08-01'
FROM dim_products p WHERE p.product_name = 'Crimson Flame';

INSERT INTO fact_inventory (product_id, category_id, warehouse_id, stock_box, last_update)
SELECT p.product_id, p.category_id, 2, 80, '2025-08-01'
FROM dim_products p WHERE p.product_name = 'Crimson Flame';

INSERT INTO fact_inventory (product_id, category_id, warehouse_id, stock_box, last_update)
SELECT p.product_id, p.category_id, 1, 60, '2025-08-01'
FROM dim_products p WHERE p.product_name = 'Dusty Rose';

INSERT INTO fact_inventory (product_id, category_id, warehouse_id, stock_box, last_update)
SELECT p.product_id, p.category_id, 3, 100, '2025-08-01'
FROM dim_products p WHERE p.product_name = 'Dusty Rose';

INSERT INTO fact_inventory (product_id, category_id, warehouse_id, stock_box, last_update)
SELECT p.product_id, p.category_id, 2, 200, '2025-08-01'
FROM dim_products p WHERE p.product_name = 'Maple Syrup';

INSERT INTO fact_inventory (product_id, category_id, warehouse_id, stock_box, last_update)
SELECT p.product_id, p.category_id, 1, 90, '2025-08-01'
FROM dim_products p WHERE p.product_name = 'Crystal Shine';

INSERT INTO fact_inventory (product_id, category_id, warehouse_id, stock_box, last_update)
SELECT p.product_id, p.category_id, 2, 50, '2025-08-01'
FROM dim_products p WHERE p.product_name = 'Redwood';

INSERT INTO fact_inventory (product_id, category_id, warehouse_id, stock_box, last_update)
SELECT p.product_id, p.category_id, 3, 75, '2025-08-01'
FROM dim_products p WHERE p.product_name = 'Blush Nude';

INSERT INTO fact_inventory (product_id, category_id, warehouse_id, stock_box, last_update)
SELECT p.product_id, p.category_id, 1, 140, '2025-08-01'
FROM dim_products p WHERE p.product_name = 'Ruby Drop';

INSERT INTO fact_inventory (product_id, category_id, warehouse_id, stock_box, last_update)
SELECT p.product_id, p.category_id, 2, 110, '2025-08-01'
FROM dim_products p WHERE p.product_name = 'Warm Tan';

INSERT INTO fact_inventory (product_id, category_id, warehouse_id, stock_box, last_update)
SELECT p.product_id, p.category_id, 3, 95, '2025-08-01'
FROM dim_products p WHERE p.product_name = 'Warm Honey';

INSERT INTO fact_inventory (product_id, category_id, warehouse_id, stock_box, last_update)
SELECT p.product_id, p.category_id, 1, 88, '2025-08-01'
FROM dim_products p WHERE p.product_name = 'Ivory Radiance';

INSERT INTO fact_inventory (product_id, category_id, warehouse_id, stock_box, last_update)
SELECT p.product_id, p.category_id, 2, 130, '2025-08-01'
FROM dim_products p WHERE p.product_name = 'Sunlit Tan';

INSERT INTO fact_inventory (product_id, category_id, warehouse_id, stock_box, last_update)
SELECT p.product_id, p.category_id, 3, 70, '2025-08-01'
FROM dim_products p WHERE p.product_name = 'Dew Boost Mist';

INSERT INTO fact_inventory (product_id, category_id, warehouse_id, stock_box, last_update)
SELECT p.product_id, p.category_id, 1, 44, '2025-08-01'
FROM dim_products p WHERE p.product_name = 'Terracotta Dust';

INSERT INTO fact_inventory (product_id, category_id, warehouse_id, stock_box, last_update)
SELECT p.product_id, p.category_id, 2, 66, '2025-08-01'
FROM dim_products p WHERE p.product_name = 'Mega Volume';

INSERT INTO fact_inventory (product_id, category_id, warehouse_id, stock_box, last_update)
SELECT p.product_id, p.category_id, 3, 55, '2025-08-01'
FROM dim_products p WHERE p.product_name = 'Soft Black';

SELECT 
    f.inventory_id,
    p.product_name,
    c.category_name,
    w.warehouse_location,
    f.stock_box,
    f.last_update
FROM fact_inventory f
JOIN dim_products p ON f.product_id = p.product_id
JOIN dim_categories c ON f.category_id = c.category_id
JOIN dim_warehouse w ON f.warehouse_id = w.warehouse_id
ORDER BY f.last_update DESC;

