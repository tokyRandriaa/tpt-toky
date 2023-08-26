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

$name = $_POST['name'];
$email = $_POST['email'];
$password = $_POST['password'];

$sql = "INSERT INTO utilisateur (nom, email, password) VALUES ('$name', '$email', '$password')";

if ($conn->query($sql) === TRUE) {
    echo "Inscription réussie";
} else {
    echo "Erreur lors de l'inscription : " . $conn->error;
}

$conn->close();
?>
