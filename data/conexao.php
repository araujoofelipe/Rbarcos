<?php
$conn = new mysqli("localhost", "root", "", "rbarcos_hotel");
if ($conn->connect_errno) {
    die("conexão falhou " . $conn->connect_errno);
}
