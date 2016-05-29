CREATE DATABASE IF NOT EXISTS duoshoudang CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS duoshoudang.users
(
  user_id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  username VARCHAR(30) NOT NULL,
  email VARCHAR(60) NOT NULL,
  password VARCHAR(50) NOT NULL,
  salt VARCHAR(6) NOT NULL,
  type VARCHAR(12) NOT NULL,
  regtime INT(11),
  INDEX ('email')
);

CREATE TABLE IF NOT EXISTS duoshoudang.authorization
(
  token VARCHAR(32) PRIMARY KEY NOT NULL,
  user_id INT(11) NOT NULL,
  tokentime INT(11) NOT NULL,
  type VARCHAR(10) NOT NULL
);

CREATE TABLE IF NOT EXISTS duoshoudang.goods
(
  gid INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  name VARCHAR(32) NOT NULL,
  cid INT(6) NOT NULL,
  info TEXT NOT NULL,
  abstract TEXT NOT NULL,
  description LONGTEXT NOT NULL,
  timestamp INT(11),
  FOREIGN KEY (cid) REFERENCES category(cid)
);

CREATE TABLE IF NOT EXISTS duoshoudang.category
(
  cid INT(6) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  name VARCHAR(32) NOT NULL
);

CREATE TABLE IF NOT EXISTS duoshoudang.shopping_cart
(
  user_id INT NOT NULL,
  good_id INT NOT NULL,
  number INT,
  sort_identifier VARCHAR(20) NOT NULL,
  CONSTRAINT PRIMARY KEY (user_id, good_id, sort_identifier)
);

CREATE TABLE IF NOT EXISTS duoshoudang.bill
(
  bill_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  paid BOOL NOT NULL DEFAULT FALSE,
  deal BOOL NOT NULL DEFAULT FALSE,
  comment TEXT NOT NULL DEFAULT NULL,
  info LONGTEXT,
  timestamp INT(11),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE files
(
    fid INT(11) PRIMARY KEY NOT NULL,
    fhash VARCHAR(64) NOT NULL,
    owner_id INT(11) NOT NULL,
    size INT(11) NOT NULL,
    ext VARCHAR(20) NOT NULL,
    create_time INT(11) NOT NULL,
    modify_time INT(11),
    file_name VARCHAR(50)
);
CREATE UNIQUE INDEX files_fhash_uindex ON files (fhash);