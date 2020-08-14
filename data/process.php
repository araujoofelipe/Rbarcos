<?php
require_once("conexao.php");

$result = array('error' => false);
$action = '';

if (isset($_GET['action'])) {
    $action = $_GET['action'];
} else if (isset($_POST['action'])) {
    $action = $_POST['action'];
}


switch ($action) {
    case 'read':
        $query = "select * from hoteis";
        $sql = mysqli_query($conn, $query);
        $hoteis = array();
        while ($row = $sql->fetch_assoc()) {
            array_push($hoteis, $row);
        }
        $result['hoteis'] = $hoteis;
        echo json_encode($result);
        break;

    case 'readquartos':
        $id = $_GET['id'];
        $query = "SELECT nome,descricao,preco,capacidade,qtd_camas FROM quartos q inner join hoteis h on q.id_hotel = h.id where q.id_hotel = " . $id;
        $sql = mysqli_query($conn, $query);
        $quartos = array();
        while ($row = $sql->fetch_assoc()) {
            array_push($quartos, $row);
        }
        $result['quartos'] = $quartos;
        echo json_encode($result);
        break;
    case 'create':
        $nome = $_POST['name'];
        $localizacao = $_POST['localizacao'];
        $sobre = $_POST['sobre'];
        $fotos = $_POST['fotos'];
        $comodidades = $_POST['comodidades'];
        $query = "INSERT INTO hoteis (name,localizacao,sobre,fotos,comodidades) VALUES ('$nome','$localizacao','$sobre','$fotos','$comodidades')";
        $sql = mysqli_query($conn, $query);
        if ($sql) {
            $result['message'] = "Hotel Cadastrado com Sucesso";
        } else {
            $result['error'] = true;
            $result['message'] = "Falha ao Cadastrar Hotel";
        }
        echo json_encode($result);
        break;
    case 'createquarto':
        $id_hotel = $_GET['id'];
        $nome = $_POST['nome'];
        $descricao = $_POST['descricao'];
        $preco = $_POST['preco'];
        $capacidade = $_POST['capacidade'];
        $qtd_camas = $_POST['qtd_camas'];
        $fotos = $_POST['fotos'];
        $query = "INSERT INTO quartos (id_hotel,nome,descricao,preco,capacidade,qtd_camas,fotos) VALUES ('$id_hotel','$nome','$descricao','$preco','$capacidade','$qtd_camas','$fotos')";
        $sql = mysqli_query($conn, $query);
        if ($sql) {
            $result['message'] = "Quarto Cadastrado com Sucesso";
        } else {
            $result['error'] = true;
            $result['message'] = "Falha ao Cadastrar Quarto";
        }
        echo json_encode($result);
        break;
}
