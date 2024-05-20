<?php
session_start(); // Startar en session 

// Kontrollerar om formuläret har skickats via POST-metoden
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Databasanslutning
    require_once "dbconn.php";

    // Escapar användarinput för att förhindra SQL-injektion
    $username = mysqli_real_escape_string($conn, $_POST['username']);
    $password = mysqli_real_escape_string($conn, $_POST['password']);

    // SQL-fråga för att hämta användarinformation från databasen baserat på användarnamn
    $sql = "SELECT * FROM users WHERE username = '$username'";
    $result = mysqli_query($conn, $sql);

    // Kollar om en rad returneras från databasen
    if ($result && mysqli_num_rows($result) == 1) {
        $row = mysqli_fetch_assoc($result);
        
        // Jämför det angivna lösenordet med det hashade lösenordet i databasen
        if (password_verify($password, $row['password'])) {
            // Sätter sessionen som inloggad och sparar användar-ID och användarnamn
            $_SESSION['customer_logged_in'] = true;
            $_SESSION['user_id'] = $row['user_id'];
            $_SESSION['username'] = $row['username'];
            header("Location: kundsida.php"); // Omdirigerar till kundsidan
            exit();
        } else {
            // Visar felmeddelande om lösenordet inte matchar
            $error = "Fel användarnamn eller lösenord!";
        }
    } else {
        // Visa felmeddelande vid annat fel
        $error = "Fel användarnamn eller lösenord!";
    }
}
?>

<!DOCTYPE html>
<html lang="sv">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kundinloggning</title>
    <link rel="stylesheet" href="login.css"> 
</head>
<body>
    <!-- hemknapp -->
    <form action="start.php" method="get">
        <button type="submit" class="hem">⌂</button>
    </form>

    <div class="container">
        <h2>Logga in som kund</h2>
        <!-- Formulär för inloggning -->
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
            <input type="text" class="inputfält" id="username" name="username" placeholder="Användarnamn" required><br>
            <input type="password" class="inputfält" id="password" name="password" placeholder="Lösenord" required><br><br>
            <input type="submit" class="button" value="Logga in">
        </form>
        <!-- Länk till registrering -->
        <p>Har du inget konto? <a href="signup.php">Registrera dig här</a></p>
        <!-- Visar felmeddelande om inloggningen misslyckas -->
        <?php if (isset($error)) { echo '<div class="error">' . $error . '</div>'; } ?>
    </div>
</body>
</html>
