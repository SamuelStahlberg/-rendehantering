<?php
session_start(); // Startar en session för att kunna hantera inloggningsstatus

// Kontrollerar om formuläret har skickats
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Databasanslutning
    require_once "dbconn.php";

    // Escapar användarinput för att förhindra SQL-injektion
    $username = mysqli_real_escape_string($conn, $_POST['username']);
    $password = mysqli_real_escape_string($conn, $_POST['password']);

    // SQL-fråga för att kontrollera om användarnamn, lösenord och roll matchar en admin i databasen
    $sql = "SELECT * FROM users WHERE username = '$username' AND password = '$password' AND role = 'admin'";
    $result = mysqli_query($conn, $sql);

    // Om en rad returneras från databasen, sätter admin_logged_in till true och omdirigerar till dashboard.php
    if (mysqli_num_rows($result) == 1) {
        $_SESSION['admin_logged_in'] = true;
        header("Location: dashboard.php");
        exit();
    } else {
        // Om ingen rad matchar, visa ett felmeddelande
        $error = "Fel användarnamn eller lösenord!";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8">
    <title>Admin Login</title>
    <link rel="stylesheet" href="admin.css">
</head>
<body>
    <!-- hemknapp till startsidan -->
    <form action="start.php" method="get">
        <button type="submit" class="hem">⌂</button>
    </form>
    <div class="container">
        <h2>Logga in som admin</h2>
        <!-- Formulär för inloggning -->
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
            <input type="text" class="inputfält" id="username" name="username" placeholder="Användarnamn" required><br>
            <input type="password" class="inputfält" id="password" name="password" placeholder="Lösenord" required><br><br>
            <input type="submit" class="button" value="Logga in">
        </form>
        <!-- Visar felmeddelande om inloggningen misslyckas -->
        <?php if (isset($error)) { echo $error; } ?>
    </div>
</body>
</html>
