-- 1. List all students
SELECT * FROM students;

-- 2. Show all invoices
SELECT * FROM invoices;

-- 3. Find unpaid or partially paid invoices
SELECT * FROM invoice_balances
WHERE balance > 0;

-- 4. Show payment history
SELECT * FROM payments
ORDER BY payment_date;

-- 5. Calculate total collections
SELECT SUM(amount_paid) AS total_collections
FROM payments;

-- 6. Find overdue invoices
SELECT * FROM invoice_balances
WHERE balance > 0
AND due_date < '2026-10-01';

-- 7. Total payments by fee type
SELECT f.fee_name, SUM(p.amount_paid) AS total_paid
FROM fee_types f
JOIN invoices i ON f.fee_type_id = i.fee_type_id
JOIN payments p ON i.invoice_id = p.invoice_id
GROUP BY f.fee_name;

-- 8. Show discounts
SELECT * FROM discounts;

-- 9. Students with more than one invoice
SELECT student_id, COUNT(*) AS invoice_count
FROM invoices
GROUP BY student_id
HAVING COUNT(*) > 1;

-- 10. Outstanding balance per student
SELECT admission_no, student_name,
SUM(balance) AS total_outstanding
FROM invoice_balances
GROUP BY admission_no, student_name
HAVING SUM(balance) > 0;
