<!doctype html>

<!--Sessions that CAN MAYBE exist
		*$_SESSION["UserID"]

		*$_SESSION["Usertag"]
		*$_SESSION["User_Email"]
		*$_SESSION["User_Password"]
		
		*$_SESSION["Selected_Repo_ID"]
		*$_SESSION['Selected_Repo']
		
		*$_SESSION["Commits"]
-->

<?php

	require "php\Security.php";
	require "php\Sql.php";
	
	session_start();
	
	if (isset($_SESSION["UserID"]))	//if you logout of any of the other pages, you won't be able to go back to any of the other pages in a Login state
	{
		session_destroy(); 
	}

	$email = $password = $errEmail = $errPass = $errCommon = "";

	if ($_SERVER["REQUEST_METHOD"] == "POST")		//Do this after "submit"
	{
		
		//the following lines do 2 things : 1.Runs 'TestInput' en stores result in $email; 2.If $email IS -1 run 'getErrorMessage()' from Security.php to set $errEmail to the given error message, to be display next to the textfield
		$errEmail = ($email = TestInput($_POST["txtEmail"],1,0,0)) === -1 ? getErrorMessage() : ""; //"TestInput" from Security.php, validates input data and makes it more secure
		$errPass = ($password = TestInput($_POST["txtPassword"],0,6,44)) === -1 ? getErrorMessage() : ""; 	
		
		if ($email === -1 || $password === -1) //If an error was made -1 is returned, naming something "-1" won't break the system
		{
			$email = $password = "";
		}
		else
		{ 
			$md5password = md5($password);
			//Call a stored procedure in database called 'Login_user', this uses given email & password and check if it finds anything in the database, then saves the result.
			$user_id = CallQueryArray("CALL Login_user('$email','$md5password')") or die("Connection failed: " . $connection->connect_error);

			if ($user_id[0][0] != "ERROR")  	//Uses $user_id[0][0] only, since $result only returns ONE row
			{
				$_SESSION["UserID"]=$user_id[0][0]; 
				
				header("Location:SourcePage.php");  //Login
				die();
			}
			else
			{
				$errCommon = "*No user founded with this email and password"; // Row was empty, no user not found 
			}
		}		
	}

?>

<html lang="en">
	
	<head>
		<meta charset="utf-8"/>
		<title>LuftGrid - Login</title>
		<link rel="stylesheet" href="css/mainStyles.css">
	</head>

	
	<body id="loginscr" class="loginCenter">
		<header>
			<h1 id="headingOCR">Welcome to LuftGrid</h1>     
		</header>
		
		<section>      
			<article  class="framItems">
				<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" >    
					<label>Email:</label><br>
						<input type="text" name="txtEmail" placeholder="example@gmail.com"><br>
						<span class="error"><?php echo $errEmail; ?></span><br>
					<label>Password:</label><br>
						<input type="password" name="txtPassword"><br>
						<span class="error"><?php echo $errPass; ?></span><br><br>
					<input type="submit" name="btnSubmit" value="Login">
				</form>
				<footer>
					<span class="error"><?php echo $errCommon; ?></span>
				</footer>
			</article>
			<article>
				<a href="SignUp.php" id="lblForget">Signup</a>
			</article>
		</section>
		
	</body>
</html>