echo "Global updating in progress..."
sudo apt-get update -y
echo "Global updating ended"

echo "Installation mysql-server in progress..."
sudo apt-get install apache2 -y
echo "Installation mysql-server ended"

echo "a2enmod module enable, in progress..."
sudo a2enmod rewrite
echo "a2enmod module enable, ended"


echo "Apache2 service restarting..."
sudo service apache2 restart
echo "Apache2 service restarted"


echo "Installation php-mysql in progress..."
sudo apt install php-mysql -y
echo "Installation php-mysql ended"

echo "Installation libapache2-mod-php in progress..."
sudo apt install php libapache2-mod-php -y
echo "Installation libapache2-mod-php ended"

echo "Apache2 service restarting..."
sudo service apache2 restart
echo "Apache2 service restarted"