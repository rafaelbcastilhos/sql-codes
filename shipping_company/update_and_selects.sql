UPDATE shipment SET 
    state = 'B', started = CURRENT_DATE
WHERE state = 'A';

UPDATE driver SET 
    license_valid = '2026-01-01'
WHERE license = '444444444';

UPDATE client SET
    mobile_phone = '55047999306511'
WHERE name = 'Chimbinha';

UPDATE shipment SET
    state = 'C'
WHERE id = 6;

UPDATE shipment SET
    state = 'D', finished = CURRENT_DATE
WHERE id = 9;

DELETE FROM driver
WHERE license = '999999999';

DELETE FROM package
WHERE bar_code = 'KKK123';

SELECT started, finished,
    CASE WHEN state = 'A' THEN 'IDLE'
        WHEN state = 'B' THEN 'PREPARING'
        WHEN state = 'C' THEN 'IN TRANSPORTING'
        WHEN state = 'D' THEN 'DELIVERED'
        ELSE 'EMPTY'
    END AS state
FROM shipment
ORDER BY state;

SELECT shipper.name AS shipper_name, 
	transporter.company_name AS transporter_name,
	destinator.name AS destinator_name FROM shipment 
INNER JOIN client AS shipper ON
(shipment.shipper_id = shipper.id)
INNER JOIN client AS destinator ON
(shipment.destinator_id = destinator.id)
INNER JOIN transporter AS transporter ON
(shipment.transporter_id = transporter.id)
GROUP BY shipper_name, transporter_name, destinator_name;

SELECT * FROM shipment
WHERE started = (
    SELECT MIN(started) FROM shipment
);

SELECT risk_class FROM package
INNER JOIN shipment_package ON
(shipment_package.id = package.id)
WHERE price < (SELECT AVG(price) FROM shipment_package)
GROUP BY risk_class;

SELECT name, street, address_number, neighborhood, city, state_uf, country FROM client
INNER JOIN address ON
(address.id = client.address_id)
ORDER BY country DESC;

SELECT model FROM vehicle
GROUP BY model
ORDER BY model;
