erDiagram
    STUDENTS ||--o{ INVOICES : receives
    FEE_TYPES ||--o{ INVOICES : categorizes
    INVOICES ||--o| DISCOUNTS : may_have
    INVOICES ||--o{ PAYMENTS : receives

    STUDENTS {
        int student_id PK
        string admission_no
        string first_name
        string last_name
        string class_name
    }

    FEE_TYPES {
        int fee_type_id PK
        string fee_name
    }

    INVOICES {
        int invoice_id PK
        int student_id FK
        int fee_type_id FK
        date invoice_date
        date due_date
        decimal amount
    }

    DISCOUNTS {
        int discount_id PK
        int invoice_id FK
        decimal discount_amount
    }

    PAYMENTS {
        int payment_id PK
        int invoice_id FK
        decimal amount_paid
        date payment_date
    }
