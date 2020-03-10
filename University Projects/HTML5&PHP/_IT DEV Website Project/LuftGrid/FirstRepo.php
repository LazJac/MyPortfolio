<!doctype html>

<!--Sessions that NEED to exist
		*$_SESSION["UserID"]
-->
<!--Sessions that CAN MAYBE exist
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

	$userid = $_SESSION["UserID"]; //set to var for easy use in 'CallQueryArray()'
	if (isset($userid)) 
	{
		
		$create = $errCreate = "";
		if ($_SERVER["REQUEST_METHOD"] == "POST")		//Do this after "submit"
		{
			
			if (isset($_POST['btnCreateRepo']))
			{
				$errCreate = ($create = TestInput($_POST['txtRepo'],0,0,44)) === -1 ? getErrorMessage() : "";
				
				if($create === -1)
				{
					$create = "";
				}
				else
				{
					$isPri = 0;
					if ($_POST['isPrivate'] == "Private")
					{
						$isPri = 1;
					}
					$create = str_replace(' ','_',$create);
					CallQuery("CALL create_repo('$userid','$create','$isPri')");
					
					header("Location:SourcePage.php");
					die();
				}				
			}
		}		
	}
	else
	{
		header("Location:Homepage.php");
		die();
	}
	
?>

<html lang="en">
	
	<head>
		<meta charset="utf-8"/>
		<title>LuftGrid - First Repository</title>
		<link rel="stylesheet" href="css/mainStyles.css">
	</head>

	
	<body>
		<header>
			<h1 id="headingOCRsimple">First Repository</h1>     
		</header>
		
		<div id="d1_scr" class="framItems">
			<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" >    
				<label>Create new repository:</label><br>
					<input type="text" name="txtRepo">
					<span class="error"><?php echo $errCreate; ?></span><br>
				<label>Repsoitory is:</label><br>
					<input type="radio" name="isPrivate" value="Public" checked>Public<br>
					<input type="radio" name="isPrivate" value="Private">Private<br><br>
				<input type="submit" name="btnCreateRepo" value="Create">
			</form>
		</div>
	</body>
</html>