CREATE USER 'drupal'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON mariadb.* TO 'drupal'@'%';
FLUSH PRIVILEGES;
