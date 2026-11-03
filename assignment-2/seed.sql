CREATE TABLE students (
    id   SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE menu_items (
    id    SERIAL PRIMARY KEY,
    name  TEXT NOT NULL,
    price NUMERIC(6,2) NOT NULL CHECK (price > 0)
);

CREATE TABLE orders (
    id         SERIAL PRIMARY KEY,
    order_date DATE NOT NULL
);

CREATE TABLE order_items (
    order_id   INTEGER NOT NULL REFERENCES orders(id),
    student_id INTEGER NOT NULL REFERENCES students(id),
    item_id    INTEGER NOT NULL REFERENCES menu_items(id),
    quantity   INTEGER NOT NULL CHECK (quantity > 0),
    PRIMARY KEY (order_id, student_id, item_id)
);

INSERT INTO students (name) VALUES
 ('Ani'), ('Boris'), ('Vera'), ('Georgi'), ('Diana');

INSERT INTO menu_items (name, price) VALUES
 ('Pizza Margherita', 8.50),
 ('Pizza Prosciutto', 10.90),
 ('Lasagna',           9.20),
 ('Salad',             6.40),
 ('Coca-Cola',         2.50),
 ('Tiramisu',          5.80);

INSERT INTO orders (order_date) VALUES
 ('2026-10-27'), ('2026-11-03');

INSERT INTO order_items (order_id, student_id, item_id, quantity) VALUES
 (1, 1, 1, 1),
 (1, 2, 2, 1),
 (1, 2, 5, 2),
 (1, 3, 3, 1),
 (1, 4, 4, 1),
 (1, 5, 1, 1),
 (2, 1, 6, 2),
 (2, 3, 2, 1),
 (2, 4, 5, 1);