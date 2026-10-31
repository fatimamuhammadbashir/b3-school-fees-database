PRAGMA foreign_keys = ON;

CREATE TABLE students (
    student_id INTEGER PRIMARY KEY,
    admission_no TEXT NOT NULL UNIQUE,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    class_name TEXT NOT NULL,
    email TEXT UNIQUE
);

CREATE TABLE fee_types (
    fee_type_id INTEGER PRIMARY KEY,
    fee_name TEXT NOT NULL UNIQUE,
    description TEXT
);

CREATE TABLE invoices (
    invoice_id INTEGER PRIMARY KEY,
    student_id INTEGER NOT NULL,
    fee_type_id INTEGER NOT NULL,
    invoice_date TEXT NOT NULL,
    due_date TEXT NOT NULL,
    amount REAL NOT NULL CHECK (amount >= 0),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (fee_type_id) REFERENCES fee_types(fee_type_id)
);

CREATE TABLE discounts (
    discount_id INTEGER PRIMARY KEY,
    invoice_id INTEGER NOT NULL UNIQUE,
    discount_amount REAL NOT NULL CHECK (discount_amount >= 0),
    reason TEXT NOT NULL,
    FOREIGN KEY (invoice_id) REFERENCES invoices(invoice_id)
);

CREATE TABLE payments (
    payment_id INTEGER PRIMARY KEY,
    invoice_id INTEGER NOT NULL,
    payment_date TEXT NOT NULL,
    amount_paid REAL NOT NULL CHECK (amount_paid > 0),
    payment_method TEXT NOT NULL,
    reference_no TEXT NOT NULL UNIQUE,
    FOREIGN KEY (invoice_id) REFERENCES invoices(invoice_id)
);
