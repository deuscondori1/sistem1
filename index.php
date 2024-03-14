<?php
    require_once "src/conexion/conexion.php";
    
    $conexion = new conexion;

    //$query = "select * from usuarios";
    $query = "INSERT IBTO usuarios (DNI)value('1')";
    
    //print_r($conexion->obtenerDatos($query));

    print_r($conexion->nonQuery($query));
?>