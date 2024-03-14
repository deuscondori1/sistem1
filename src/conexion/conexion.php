<?php
class conexion{

     private $server;
     private $user;
     private $password;
     private $port;
     private $conexion;


    function __construct(){
        $listardatos = $this->datosconect();
        foreach($listardatos as $key=> $value){
        $this->server = $value['server'];
        $this->user = $value['user'];
        $this->password = $value['password'];
        $this->port = $value['port'];
        }
        $this->conexion = new mysqli($this->server, $this->user, $this->password, $this->port);
        if ( $this->conexion->connect_errno){
            echo "algo salio mal verifique la coneccion";
            die();
        }
    }
    

    private function datosconect(){
        $direccion = dirname(__FILE__);
        $jsondata = file_get_contents($direccion. "/" . "config");
        return json_decode($jsondata, true);
    }










    }
?>