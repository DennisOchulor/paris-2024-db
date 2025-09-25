-- Dennis Nwanevu Chong Ochulor - 22472393
-- Script that creates the database

DROP DATABASE IF EXISTS Paris2024_22472393; -- ensure no duplicates
CREATE DATABASE Paris2024_22472393;
USE Paris2024_22472393;

-- SET global log_bin_trust_function_creators = ON; -- allow trigger creation (not needed for now)

-- Create the default user - to be used during python connectivity
CREATE USER IF NOT EXISTS 'admin'@'localhost' IDENTIFIED BY '12345';
GRANT ALL PRIVILEGES ON Paris2024_22472393.* TO 'admin'@'localhost';
