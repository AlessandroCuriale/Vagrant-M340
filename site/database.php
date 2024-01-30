<?php
    require 'persona.php';

    Class Database
    {

        private static $_mysqlUser = 'dbUser';
        private static $_mysqlPass = 'dbPassword';
        private static $_mysqlDB = 'persona';
        private static $_hostName = '10.10.20.11';
        private static $_mysqlPort = 3306;
        private static $_connection = NULL;

        private function __construct()
        {
            //non faccio nulla, potrei anche rendere la classe abstract così non è istanziabile
        }

        public static function getConnection()
        {
            if (!self::$_connection) {
                self::$_connection = new mysqli(self::$_hostName, self::$_mysqlUser, self::$_mysqlPass, self::$_mysqlDB);
                if (self::$_connection->connect_error) {
                    die('Errore:' . self::$_connection->connect_error . '<br> Numero di errore:' . self::$_connection->connect_errno);
                }else{
                    echo "<h1>Connected database: <i>" . self::$_mysqlDB . "</i></h1><hr>";
                }
            }
            return self::$_connection;
        }

        public static function fetchAll():array
        {
            $selectPersona = "SELECT * FROM persona";
            $result = self::$_connection->query($selectPersona);
            foreach ($result as $line) {
                $persona = new Persona($line['id'], $line['nome'], $line['cognome'], $line['citta']);
                $allPerson[] = $persona;
                unset($persona);
            }
            return $allPerson;
        }
        //return $allPerson;
    }
    require_once 'database.php';
    $connection = Database::getConnection();
    $persone = Database::fetchAll();
