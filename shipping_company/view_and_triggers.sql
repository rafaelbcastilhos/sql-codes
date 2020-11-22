CREATE VIEW truck_drivers AS
SELECT driver.license, vehicle.license_plate, 
	vehicle.model, vehicle.manufacturer FROM driver
INNER JOIN vehicle ON
(driver.vehicle_id = vehicle.id)
WHERE vehicle.model = 'Caminhao'
ORDER BY vehicle.manufacturer;

CREATE FUNCTION count_drivers_transporter(INTEGER)
    RETURNS INT8 AS $$
        SELECT COUNT(driver.id) FROM driver
        INNER JOIN transporter ON
        (driver.transporter_id = transporter.id)
        WHERE transporter.id = $1
    $$
LANGUAGE SQL;

CREATE FUNCTION log_delivered()
RETURNS TRIGGER AS $$
    BEGIN
        IF NEW.state = 'D' THEN
            INSERT INTO log_delivered VALUES
                (NEW.id, NEW.shipper_id, NEW.destinator_id, NEW.transporter_id);
        END IF;
        RETURN NEW;
    END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER shipment_delivered
AFTER UPDATE ON shipment
FOR EACH ROW EXECUTE PROCEDURE log_delivered();
