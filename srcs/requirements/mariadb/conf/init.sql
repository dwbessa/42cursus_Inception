CREATE DATABASE IF NOT EXISTS inception_db;
CREATE USER IF NOT EXISTS 'felipe'@'%' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON inception_db.* TO 'felipe'@'%';
FLUSH PRIVILEGES;
