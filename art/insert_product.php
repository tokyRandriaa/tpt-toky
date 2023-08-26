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

$nom = $_POST['nom'];
$type = $_POST['type'];
$prix = $_POST['prix'];
$etoile = $_POST['etoile'];
$description = $_POST['description'];
$image = $_POST['image']; // C'est une URL vers l'image, vous pouvez traiter le téléchargement d'image si nécessaire

// Échapper les données pour éviter les injections SQL (sécurité importante)
$nom = $conn->real_escape_string($nom);
$type = $conn->real_escape_string($type);
$prix = $conn->real_escape_string($prix);
$etoile = $conn->real_escape_string($etoile);
$description = $conn->real_escape_string($description);
$image = $conn->real_escape_string($image);

$sql = "INSERT INTO produits (nom, type, prix, etoile, description, images) 
        VALUES ('$nom', '$type', '$prix', '$etoile', '$description', '$image')";

if ($conn->query($sql) === TRUE) {
    echo "success";
} else {
    echo "failure";
}

$conn->close();
?>
