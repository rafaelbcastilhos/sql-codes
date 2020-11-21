CREATE TABLE address(
	id INTEGER NOT NULL,
    country VARCHAR(30) NOT NULL,
    state_uf VARCHAR(2) NOT NULL,
    city VARCHAR(30) NOT NULL,
    street VARCHAR(255) NOT NULL,
    address_number NUMERIC(6),
    neighborhood VARCHAR(30) NOT NULL,
    reference VARCHAR(255),
    zip NUMERIC(8) NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE client(
	id INTEGER NOT NULL,
    name VARCHAR(30) NOT NULL,
    federal_tax VARCHAR(11) NOT NULL,
    mobile_phone VARCHAR(14) NOT NULL,
    address_id INTEGER NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY(id) REFERENCES address(id),
	UNIQUE(federal_tax),
	UNIQUE(mobile_phone)
);

CREATE TABLE package(
	id INTEGER NOT NULL,
    bar_code VARCHAR(255) NOT NULL,
    risk_class VARCHAR(30),
    tracking_code VARCHAR(12) NOT NULL,
    category VARCHAR(30),
	client_id INTEGER NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY(client_id) REFERENCES client(id),
	UNIQUE(tracking_code)
);

CREATE TABLE transporter(
	id INTEGER NOT NULL,
    company_name VARCHAR(30) NOT NULL,
    federal_tax VARCHAR(14) NOT NULL,
    email VARCHAR(30) NOT NULL,
    phone VARCHAR(13) NOT NULL,
	PRIMARY KEY(id),
	UNIQUE(federal_tax),
	UNIQUE(email)
);

CREATE TABLE vehicle(
	id INTEGER NOT NULL,
    license_plate VARCHAR(7) NOT NULL,
    manufacturer VARCHAR(30),
    model VARCHAR(30),
    color VARCHAR(30),
    category VARCHAR(30),
	PRIMARY KEY(id),
	UNIQUE(license_plate)
);

CREATE TABLE driver(
	id INTEGER NOT NULL,
    license VARCHAR(11) NOT NULL,
    license_valid DATE NOT NULL,
    transporter_id INTEGER NOT NULL,
    vehicle_id INTEGER NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY(transporter_id) REFERENCES transporter(id),
	FOREIGN KEY(vehicle_id) REFERENCES vehicle(id),
	UNIQUE(license)
);

CREATE TABLE shipment(
	id INTEGER NOT NULL,
    started DATE,
    finished DATE,
    state CHAR,
    shipper_id INTEGER NOT NULL,
    destinator_id INTEGER NOT NULL,
    transporter_id INTEGER NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY(shipper_id) REFERENCES client(id),
	FOREIGN KEY(destinator_id) REFERENCES client(id),
	FOREIGN KEY(transporter_id) REFERENCES transporter(id)
);

CREATE TABLE shipment_package(
	id INTEGER NOT NULL,
    price NUMERIC(4,2),
    package_id INTEGER NOT NULL,
    shipment_id INTEGER NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY(package_id) REFERENCES package(id),
	FOREIGN KEY(shipment_id) REFERENCES shipment(id)
);

CREATE TABLE shipment_vehicle(
	id INTEGER NOT NULL,
    vehicle_id INTEGER NOT NULL,
    shipment_id INTEGER NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY(vehicle_id) REFERENCES vehicle(id),
	FOREIGN KEY(shipment_id) REFERENCES shipment(id)
);