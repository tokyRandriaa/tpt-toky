<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "art";

// Créer la connexion
$conn = new mysqli($servername, $username, $password, $dbname);

// Vérifier la connexion
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}


$searchTerm = $_GET['search'];

$query = "SELECT * FROM produits WHERE nom LIKE '%$searchTerm%' OR type LIKE '%$searchTerm%'";
$result = $conn->query($query);

if ($result->num_rows > 0) {
    $products = array();
    while ($row = $result->fetch_assoc()) {
        $products[] = $row;
    }
    echo json_encode($products);
} else {
    echo json_encode(array());
}

$conn->close();
?>
