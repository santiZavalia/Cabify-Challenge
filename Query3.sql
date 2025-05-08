-- Cabify, Challenge Data Analytics, Santiago de Zavalia

-- RDBMS: MySQL v8


-- For each country, the 5 cities that have a higher % of discount (in relation to the price)

WITH CityRanking AS (
    SELECT
        j.city,
        j.country,
        (SUM(ie.discount) / SUM(ie.price)) AS discount_percentage,
        ROW_NUMBER() OVER (PARTITION BY j.country ORDER BY (SUM(ie.discount) / SUM(ie.price)) DESC) AS row_num
    FROM invoice_entries ie
    INNER JOIN journeys j 
        ON ie.journey_id = j.journey_id
    GROUP BY j.city, j.country
)
SELECT
    country,
    city,
    discount_percentage
FROM CityRanking
WHERE row_num <= 5 -- Used for limiting the first 5 rows of each country
ORDER BY country, discount_percentage DESC
;