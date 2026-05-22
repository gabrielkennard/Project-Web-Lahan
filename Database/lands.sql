CREATE DATABASE land_rental;
USE land_rental;

CREATE TABLE lands (
land_id INT AUTO_INCREMENT PRIMARY KEY,
title VARCHAR (150),
size DECIMAL (10,2),
location VARCHAR (250),
google_maps_link VARCHAR (500),

prize DECIMAL (20,2),
prize_type VARCHAR (20) DEFAULT 'per month',

purpose VARCHAR (250),

distance_tol DECIMAL (10,2),
distance_harbour DECIMAL (10,2),

industrial_permit BOOLEAN,
AMDAL BOOLEAN,

nearest_factory VARCHAR (250),

advantages TEXT,

landstatus ENUM('available','not available') DEFAULT 'available',

created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

USE land_rental;
ALTER TABLE lands CHANGE prize price DECIMAL (20,2);
ALTER TABLE lands CHANGE prize_type price_type VARCHAR (20) DEFAULT 'per month';

USE land_rental;
CREATE TABLE land_translation(
translation_id INT AUTO_INCREMENT PRIMARY KEY,
land_id INT,
language VARCHAR(10),

title VARCHAR(150),
location VARCHAR(250),
purpose VARCHAR(250),
nearest_factory VARCHAR(250),
advantages TEXT,

FOREIGN KEY (land_id) REFERENCES lands(land_id)
);

CREATE TABLE land_image(
image_id INT AUTO_INCREMENT PRIMARY KEY,
land_id INT,
image_url VARCHAR(500),

FOREIGN KEY (land_id) REFERENCES lands(land_id)
);
 
 USE land_rental;
 select @@version