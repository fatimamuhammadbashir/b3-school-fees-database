INSERT INTO students VALUES
(1,'FMB001','Aisha','Bello','JSS1','aisha@example.com'),
(2,'FMB002','Musa','Ibrahim','JSS2','musa@example.com'),
(3,'FMB003','Zainab','Yusuf','SS1','zainab@example.com'),
(4,'FMB004','Umar','Abdullahi','JSS1','umar@example.com'),
(5,'FMB005','Maryam','Sani','SS2','maryam@example.com');

INSERT INTO fee_types VALUES
(1,'Tuition','Term tuition fee'),
(2,'Examination','Examination fee'),
(3,'Sports','Sports and activity fee');

INSERT INTO invoices VALUES
(1,1,1,'2026-09-01','2026-09-30',50000),
(2,1,2,'2026-09-01','2026-09-20',10000),
(3,2,1,'2026-09-01','2026-09-30',50000),
(4,3,1,'2026-09-01','2026-09-30',50000),
(5,4,3,'2026-09-05','2026-09-25',8000),
(6,5,2,'2026-09-01','2026-09-20',10000),
(7,2,2,'2026-09-01','2026-09-20',10000);

INSERT INTO discounts VALUES
(1,4,5000,'Approved merit discount'),
(2,6,1000,'Sibling support discount');

INSERT INTO payments VALUES
(1,1,'2026-09-10',30000,'Bank Transfer','PAY-1001'),
(2,2,'2026-09-12',10000,'Cash','PAY-1002'),
(3,3,'2026-09-15',20000,'Bank Transfer','PAY-1003'),
(4,4,'2026-09-18',15000,'POS','PAY-1004'),
(5,5,'2026-09-20',8000,'Cash','PAY-1005'),
(6,6,'2026-09-19',4000,'Bank Transfer','PAY-1006');
