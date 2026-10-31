PRAGMA foreign_keys = ON;

CREATE TABLE students (
    student_id INTEGER PRIMARY KEY,
    admission_no TEXT UNIQUE NOT NULL,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    class_name TEXT NOT NULL,
    email TEXT
);

CREATE TABLE fee_types (
    fee_type_id INTEGER PRIMARY KEY,
    fee_name TEXT UNIQUE NOT NULL,
    description TEXT
);

CREATE TABLE invoices (
    invoice_id INTEGER PRIMARY KEY,
    student_id INTEGER NOT NULL,
    fee_type_id INTEGER NOT NULL,
    invoice_date TEXT NOT NULL,
    due_date TEXT NOT NULL,
    amount REAL NOT NULL CHECK(amount >= 0),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (fee_type_id) REFERENCES fee_types(fee_type_id)
);

CREATE TABLE discounts (
    discount_id INTEGER PRIMARY KEY,
    invoice_id INTEGER NOT NULL,
    discount_amount REAL NOT NULL CHECK(discount_amount >= 0),
    reason TEXT,
    FOREIGN KEY (invoice_id) REFERENCES invoices(invoice_id)
);

CREATE TABLE payments (
    payment_id INTEGER PRIMARY KEY,
    invoice_id INTEGER NOT NULL,
    payment_date TEXT NOT NULL,
    amount_paid REAL NOT NULL CHECK(amount_paid > 0),
    payment_method TEXT,
    payment_reference TEXT UNIQUE,
    FOREIGN KEY (invoice_id) REFERENCES invoices(invoice_id)
);

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
    i.amount - COALESCE(d.discount_amount, 0)
        - COALESCE(SUM(p.amount_paid), 0) AS balance
FROM invoices i
JOIN students s ON s.student_id = i.student_id
JOIN fee_types f ON f.fee_type_id = i.fee_type_id
LEFT JOIN discounts d ON d.invoice_id = i.invoice_id
LEFT JOIN payments p ON p.invoice_id = i.invoice_id
GROUP BY i.invoice_id;
