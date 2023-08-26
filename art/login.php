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

$email = $_POST['email'];
$password = $_POST['password'];

// Échapper les données pour éviter les injections SQL (sécurité importante)
$email = $conn->real_escape_string($email);
$password = $conn->real_escape_string($password);

$sql = "SELECT id, email FROM utilisateur WHERE email = '$email' AND password = '$password'";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    if ($row['email'] === 'toky@gmail.com' && $password === 'admin') {
        // Redirection vers dashboard pour l'utilisateur spécial
        echo "dashboard";
    } else {
        // Redirection normale vers home_screen pour les autres utilisateurs
        echo "success";
    }
} else {
    // Identifiants incorrects
    echo "failure";
}

$conn->close();
?>
