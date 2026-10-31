CREATE VIEW invoice_balances AS
SELECT
    i.invoice_id,
    s.admission_no,
    s.first_name || ' ' || s.last_name AS student_name,
    f.fee_name,
    i.invoice_date,
    i.due_date,
    i.amount AS invoice_amount,
    COALESCE(d.discount_amount, 0) AS discount_amount,
    COALESCE(SUM(p.amount_paid), 0) AS total_paid,
    i.amount
      - COALESCE(d.discount_amount, 0)
      - COALESCE(SUM(p.amount_paid), 0) AS balance
FROM invoices i
JOIN students s ON s.student_id = i.student_id
JOIN fee_types f ON f.fee_type_id = i.fee_type_id
LEFT JOIN discounts d ON d.invoice_id = i.invoice_id
LEFT JOIN payments p ON p.invoice_id = i.invoice_id
GROUP BY i.invoice_id;
