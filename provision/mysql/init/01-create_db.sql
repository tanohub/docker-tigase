-- create databases
CREATE DATABASE IF NOT EXISTS `tigasedb`;

-- create user and grant rights
GRANT ALL ON tigasedb.* TO tigase_user@'%' IDENTIFIED BY 'tigase_user_passwd';
GRANT SELECT, INSERT, UPDATE ON mysql.proc TO 'tigase_user'@'%';
