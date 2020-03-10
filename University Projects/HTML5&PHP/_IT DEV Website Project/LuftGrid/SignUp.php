<!doctype html>

<?php

	require "php\Security.php";
	require "php\Sql.php";

	$username = $email = $password = $cpassword = $errName = $errEmail = $errPass = $errCPass = $errCommon = "";

	if ($_SERVER["REQUEST_METHOD"] == "POST")   //Do this after "submit"
	{
		$errName = ($username = TestInput($_POST["txtUsername"],0,0,15)) === -1 ? getErrorMessage() : ""; 		//"TestInput" from Security.php, validates input data and makes it more secure
		$errEmail = ($email = TestInput($_POST["txtEmail"],1,0,0)) === -1 ? getErrorMessage() : ""; 
		$errPass = ($password = TestInput($_POST["txtPassword"],0,6,44)) === -1 ? getErrorMessage() : "";  
		$errCPass = ($cpassword = TestInput($_POST["txtCPassword"],0,6,44)) === -1 ? getErrorMessage() : "";    

		if ($username === -1 || $email === -1 || $password === -1 || $password != $cpassword) //If an error was made -1 is returned, naming something "-1" won't break the system
		{
			$username = $email = $password = $cpassword = ""; 
		}
		else if ($password != $cpassword)
		{
			$errCommon = "*Please confirm your password correctly"; 
		}
		else
		{ 
			$md5password = md5($password);
			$result = CallQueryArray("CALL create_user('$username','$email','$md5password')");  //Run create_user stored procedure
			
			//If create_user ran successfully $result = new the Users User_ID, else returns "ERROR"
			if ($result[0][0] == "ERROR")
			{
				$errCommon = "*User may already exist"; 
			}
			else
			{
				session_start();

				$_SESSION["UserID"]=$result[0][0]; 
				
				header("Location:SourcePage.php");  //Auto-Login
				die();
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
			<h1 id="headingOCRsimple">Register for LuftGrid membership</h1>     
		</header>
		
		<section>      
			<article class="framItems">
				<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" >    
					<label>Username:</label><br>
						<input type="text" name="txtUsername"><br>
						<span class="error"><?php echo $errName; ?></span><br>
					<label>Email:</label><br>
						<input type="text" name="txtEmail" placeholder="example@gmail.com"><br>
						<span class="error"><?php echo $errEmail; ?></span><br>
					<label>Password:</label><br>
						<input type="password" name="txtPassword"><br>
						<span class="error"><?php echo $errPass; ?></span><br>
					<label>Confirm Password:</label><br>
						<input type="password" name="txtCPassword"><br>
						<span class="error"><?php echo $errCPass; ?></span><br><br>
					<input type="submit" name="btnSubmit" value="Register">
						<span class="error"><?php echo $errCommon; ?></span>
				</form>
			</article>
		</section>
		
	</body>
</html>