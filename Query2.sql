-- Cabify, Challenge Data Analytics, Santiago de Zavalia

-- RDBMS: MySQL v8


-- Total invoiced amount per city and country (excluding cities whose invoiced amounts are lower than 1500)

SELECT
    j.city,
    j.country,
    i.currency, -- To discriminate between currencies
    SUM(i.amount) AS total_amount
FROM invoice_entries ie
    INNER JOIN journeys j
        ON ie.journey_id = j.journey_id
    INNER JOIN invoices i
        ON ie.invoice_id = i.invoice_id
GROUP BY j.city, j.country, i.currency
HAVING total_amount >= 1500
;