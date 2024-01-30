echo "Global updating in progress..."
sudo apt-get update -y
echo "Global updating ended"

echo "Installation mysql-server in progress..."
sudo apt-get install mysql-server -y
echo "Installation mysql-server ended"

echo "Config allow all ip, in progess..."
sudo sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mysql.conf.d/mysqld.cnf
echo "Config all ip, ended"

echo "Mysql service restarting..."
sudo service mysql restart
echo "Mysql service restarted"

echo "Database, table, and data creating in progress..."
# Create the database
MYSQL_DATABASE="persona"
NEW_USER="dbUser"
USER_IP="10.10.20.10"
NEW_USER_PASSWORD="dbPassword"

mysql -uroot -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"

# Use the database
mysql -uroot -e "USE ${MYSQL_DATABASE};"

# Create the table
mysql -uroot -e "USE ${MYSQL_DATABASE}; CREATE TABLE persona (
  id int(11) NOT NULL AUTO_INCREMENT,
  nome varchar(45) DEFAULT NULL,
  cognome varchar(45) DEFAULT NULL,
  citta varchar(45) DEFAULT NULL,
  PRIMARY KEY (id)
);"

# Insert data into the table
mysql -uroot -e "USE ${MYSQL_DATABASE}; INSERT INTO persona (nome, cognome, citta) VALUES ('John', 'Doe', 'New York');"
mysql -uroot -e "USE ${MYSQL_DATABASE}; INSERT INTO persona (nome, cognome, citta) VALUES ('Jane', 'Smith', 'Los Angeles');"
mysql -uroot -e "USE ${MYSQL_DATABASE}; INSERT INTO persona (nome, cognome, citta) VALUES ('Alice', 'Johnson', 'Chicago');"
mysql -uroot -e "USE ${MYSQL_DATABASE}; INSERT INTO persona (nome, cognome, citta) VALUES ('Bob', 'Williams', 'San Francisco');"
mysql -uroot -e "USE ${MYSQL_DATABASE}; INSERT INTO persona (nome, cognome, citta) VALUES ('Eva', 'Brown', 'Miami');"

echo "Database, table, and data have been created successfully."

echo "User, creating in progress..."
mysql -uroot -e "CREATE USER '${NEW_USER}'@'${USER_IP}' IDENTIFIED BY '${NEW_USER_PASSWORD}';"

# Grant all privileges to the new user on the persona database
mysql -uroot -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${NEW_USER}'@'${USER_IP}';"
echo "User, have been created successfully."