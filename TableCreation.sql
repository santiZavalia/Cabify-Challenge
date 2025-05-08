-- Cabify, Challenge Data Analytics, Santiago de Zavalia

-- RDBMS: MySQL v8


-- Table creation and data insertion: 
	-- We create tables that can be used for testing the final queries, filled with random data
	-- Assumption: in table 'invoices', column 'created_at' represents the invoicing period


-- Table 1: invoices

CREATE TABLE invoices (
    invoice_id VARCHAR(50) PRIMARY KEY,
    client_id VARCHAR(50),
    tax_code VARCHAR(10),
    currency VARCHAR(10),
    amount DECIMAL(10,2),
    notes TEXT,
    created_at TIMESTAMP
);

INSERT INTO invoices VALUES
    ('INV001', 'C001', 'VAT20', 'EUR', 100.00, 'Invoice for services in February', '2025-02-10'),
    ('INV002', 'C002', 'VAT10', 'ARS', 120.00, 'Invoice for consulting', '2025-02-18'),
    ('INV003', 'C001', 'VAT20', 'EUR', 150.00, 'Invoice for services in March', '2025-03-05'),
    ('INV004', 'C003', 'VAT5', 'ARS', 90.00, 'Invoice for product purchase', '2025-03-20'),
    ('INV005', 'C004', 'VAT20', 'EUR', 200.00, 'Invoice for product purchase', '2025-04-02'),
    ('INV006', 'C002', 'VAT10', 'ARS', 110.00, 'Invoice for services in April', '2025-04-28'),
    ('INV007', 'C001', 'VAT20', 'EUR', 1900.00, 'Invoice for services in May', '2025-05-01'),
    ('INV008', 'C004', 'VAT5', 'ARS', 105.00, 'Invoice for subscription', '2025-05-07')
;


-- Table 2: invoice_entries

CREATE TABLE invoice_entries (
    invoice_entry_id VARCHAR(50) PRIMARY KEY,
    invoice_id VARCHAR(50),
    journey_id VARCHAR(50),
    price DECIMAL(10,2),
    discount DECIMAL(10,2)
);

INSERT INTO invoice_entries VALUES
    ('IE001', 'INV001', 'J001', 55.00, 5.00),
    ('IE002', 'INV001', 'J002', 53.00, 3.00),
    ('IE003', 'INV002', 'J003', 130.00, 10.00),
    ('IE004', 'INV003', 'J004', 82.00, 7.00),
    ('IE005', 'INV003', 'J005', 80.00, 5.00),
    ('IE006', 'INV004', 'J006', 94.00, 4.00),
    ('IE007', 'INV005', 'J007', 212.00, 12.00),
    ('IE008', 'INV006', 'J008', 116.00, 6.00),
    ('IE009', 'INV007', 'J009', 1900.00, 0.00)
;


-- Table 3: journeys

CREATE TABLE journeys (
    journey_id VARCHAR(50) PRIMARY KEY,
    country VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO journeys VALUES
    ('J001', 'Espana', 'Madrid'),
    ('J002', 'Espana', 'Barcelona'),
    ('J003', 'Argentina', 'Buenos Aires'),
    ('J004', 'Espana', 'Valencia'),
    ('J005', 'Espana', 'Sevilla'),
    ('J006', 'Argentina', 'Buenos Aires'),
    ('J007', 'Espana', 'Alicante'),
    ('J008', 'Argentina', 'Buenos Aires'),
    ('J009', 'Espana', 'Bilbao')
;