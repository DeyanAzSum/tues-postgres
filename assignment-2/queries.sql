-- Question 1: For a given order (here order 1), who owes how much?
-- Returns: student name and amount (quantity x price, summed over all their rows).
-- For another order, change the number in the WHERE clause.
SELECT s.name,
       SUM(oi.quantity * m.price) AS owes
FROM order_items oi
JOIN students   s ON s.id = oi.student_id
JOIN menu_items m ON m.id = oi.item_id
WHERE oi.order_id = 1
GROUP BY s.name
ORDER BY s.name;

-- Question 2: The total of every order, sorted by date.
-- Returns: order id, order date and total amount.
SELECT o.id,
       o.order_date,
       SUM(oi.quantity * m.price) AS total
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN menu_items  m  ON m.id = oi.item_id
GROUP BY o.id, o.order_date
ORDER BY o.order_date;