-- Cabify, Challenge Data Analytics, Santiago de Zavalia

-- RDBMS: MySQL v8


-- Total discount per month, year and currency for the last 4 calendar months, including the current one

SELECT
    YEAR(i.created_at) AS year,
    MONTH(i.created_at) AS month,
    i.currency,
    SUM(ie.discount) AS total_discount
FROM invoices i
    INNER JOIN invoice_entries ie
        ON i.invoice_id = ie.invoice_id
WHERE i.created_at >= DATE_FORMAT (CURDATE(), '%Y-%m-01') - INTERVAL 3 MONTH
GROUP BY year, month, i.currency
ORDER BY year DESC, month DESC, i.currency -- Ordered for better readability
;