PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS products (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  description TEXT,
  price NUMERIC(10,2) NOT NULL CHECK (price >= 0),
  stock INTEGER NOT NULL DEFAULT 0 CHECK (stock >= 0),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS orders (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  customer_name TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'PENDING',
  total_amount NUMERIC(12,2) NOT NULL DEFAULT 0 CHECK (total_amount >= 0),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS order_items (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  order_id INTEGER NOT NULL,
  product_id INTEGER NOT NULL,
  quantity INTEGER NOT NULL CHECK (quantity > 0),
  unit_price NUMERIC(10,2) NOT NULL CHECK (unit_price >= 0),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
  FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE RESTRICT
);

INSERT INTO products (name, description, price, stock) VALUES
  ('Café Torrado 500g', 'Café especial, torra média', 18.50, 25),
  ('Bolo de Cenoura', 'Bolo caseiro, fatia', 6.00, 40),
  ('Caderno Artesanal', 'Caderno capa reciclada, 100 fls', 12.00, 15);

INSERT INTO orders (customer_name, status, total_amount) VALUES
  ('Marcos Silva', 'CONFIRMED', 0),
  ('Ana Pereira', 'PENDING', 0),
  ('Loja Central', 'CONFIRMED', 0);

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
  (1, 1, 1, 18.50),
  (1, 2, 1, 6.00),
  (2, 3, 2, 12.00),
  (3, 1, 5, 18.50);

UPDATE orders
SET total_amount = (
  SELECT COALESCE(SUM(quantity * unit_price),0)
  FROM order_items
  WHERE order_items.order_id = orders.id
);
