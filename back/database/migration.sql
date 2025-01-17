BEGIN; 

DROP TABLE IF EXISTS "user" CASCADE; 
DROP TABLE IF EXISTS "products" CASCADE; 
DROP TABLE IF EXISTS "orders" CASCADE; 
DROP TABLE IF EXISTS "order_details" CASCADE; 

-- Création de la table des utilisateurs
CREATE TABLE users (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "username" TEXT NOT NULL,
    "email" TEXT NOT NULL ,
    "password_hash" TEXT NOT NULL,
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);

-- Création de la table des produits
CREATE TABLE products (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "name" TEXT NOT NULL,
    "emoji" TEXT NOT NULL,
    "description" TEXT,
    "price" DECIMAL(10, 2) NOT NULL CHECK (price >= 0),
    "stock" INTEGER NOT NULL CHECK (stock >= 0),
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);

-- Création de la table des commandes
CREATE TABLE orders (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "user_id" INTEGER NOT NULL,
    "total_price" DECIMAL(10, 2) NOT NULL CHECK (total_price >= 0),
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    FOREIGN KEY ("user_id") REFERENCES users("id") ON DELETE CASCADE
);

-- Création de la table des détails des commandes
CREATE TABLE order_details (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "order_id" INTEGER NOT NULL,
    "product_id" INTEGER NOT NULL,
    "quantity" INTEGER NOT NULL CHECK (quantity > 0),
    "price" DECIMAL(10, 2) NOT NULL CHECK (price >= 0),
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY ("order_id") REFERENCES orders("id") ON DELETE CASCADE,
    FOREIGN KEY ("product_id") REFERENCES products("id") ON DELETE CASCADE
);

-- Validation de la transaction
COMMIT;