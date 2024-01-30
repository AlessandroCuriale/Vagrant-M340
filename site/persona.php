<?php
    class Persona
    {
        private $_id;
        private $_nome = '';
        private $_cognome = '';
        private $_citta = '';

        public function __construct($id,$nome, $cognome, $citta)
        {
            $this->_id = $id;
            $this->_nome = $nome;
            $this->_cognome = $cognome;
            $this->_citta = $citta;
        }

        /**
         * @return string
         */
        public function getCitta()
        {
            return $this->_citta;
        }

        /**
         * @return mixed
         */
        public function getId()
        {
            return $this->_id;
        }

        /**
         * @return string
         */
        public function getCognome()
        {
            return $this->_cognome;
        }

        /**
         * @return string
         */
        public function getNome()
        {
            return $this->_nome;
        }
    }
