<?php require_once 'database.php';
?>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="utf-8">
    <title>Utenti Db</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        table{
            border: 1px solid;
        }
        td{
            border: 1px solid ;
        }

    </style>
</head>
<body>





<h1>Lista utenti</h1>
<table>
    <tr>
        <td>ID</td>
        <td>NOME</td>
        <td>COGNOME</td>
        <td>CITTA</td>
    </tr>
    <?php foreach ($persone as $persona): ?>
        <tr>
            <td><?php echo $persona->getId(); ?></td>
            <td><?php echo $persona->getNome(); ?></td>
            <td><?php echo $persona->getCognome(); ?></td>
            <td><?php echo $persona->getCitta(); ?></td>
        </tr>
    <?php endforeach; ?>
</table>