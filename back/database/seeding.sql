-- Démarrer une transaction
START TRANSACTION;

-- Insérer des utilisateurs
INSERT INTO users (username, email, password_hash, created_at, updated_at) 
VALUES 
('john_doe', 'john@example.com', 'hashed_password_123', NOW(), NOW()),
('jane_doe', 'jane@example.com', 'hashed_password_456', NOW(), NOW());

-- Insérer des produits
INSERT INTO products (name, emoji, description, price, stock, created_at, updated_at) 
VALUES 
('Apple', '🍎', 'Fresh and juicy apple.', 0.50, 100, NOW(), NOW()),
('Burger', '🍔', 'Delicious cheeseburger.', 5.99, 50, NOW(), NOW()),
('Pizza', '🍕', 'Cheesy pepperoni pizza.', 8.99, 30, NOW(), NOW());

-- Insérer des commandes
INSERT INTO orders (user_id, total_price, created_at, updated_at) 
VALUES 
(1, 11.98, NOW(), NOW()); -- Commande pour John Doe

-- Insérer des détails de commandes
INSERT INTO order_details (order_id, product_id, quantity, price, created_at, updated_at) 
VALUES 
(1, 2, 2, 5.99, NOW(), NOW()); -- 2 Burgers pour la commande de John Doe

-- Valider la transaction
COMMIT;