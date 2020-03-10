<!doctype html>

<!--Sessions that NEED to exist
		*$_SESSION["UserID"]
		*$_SESSION["Commits"]
-->
<!--Sessions that CAN MAYBE exist
		*$_SESSION["Usertag"]
		*$_SESSION["User_Email"]
		*$_SESSION["User_Password"]
		
		*$_SESSION["Selected_Repo_ID"]
		*$_SESSION['Selected_Repo']
-->

<?php
	require "php\Security.php";
	require "php\Sql.php";

	session_start();
	

	$userid = $_SESSION["UserID"];  //set for reuse
	$commits = $_SESSION["Commits"];
	if (!(isset($userid)) && !(isset($commits)))
	{
		header("Location:Homepage.php");
		die();
	}

?>

<html lang="en">
	
	<head>
		<meta charset="utf-8"/>
		<title>Commits for project</title>
		<link rel="stylesheet" href="css/mainStyles.css">
	</head>

	
	<body>
		<header>
			<h1>Commits</h1>     
		</header>
		
		<nav>
			<div id="main">
			  <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; </span>
			</div>
		</nav>

		<div id="mySidenav" class="sidenav">
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			<a href="SourcePage.php">Source</a>
			<a href="javascript:void(0)" onclick="closeNav()">Commits</a>
			<a href="ReportPage.php">Report Issues</a>
			<a href="SettingsPage.php">Settings</a>
			<a href="HomePage.php">Logout</a>
		</div>
		
		<script type="text/javascript" src="java/navFunc.js"></script>   <!-- Allow use of 'closeNav()' and 'openNav()' for a javascript file-->


		<section>      
			<article id="d3_scr" class="framItems">
				<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" >    
					<h2>Click on a commit to view that document as its was on that time of submission:</h2>
					
					<table style="width:100%">
					<tr>
						<td>Repository</td>
						<td>Committed by</td>
						<td>Committed At</td>
						<td>Committed File Size</td>
					</tr>
					<?php		
						//Display for $commits[][]: file.File_ID{0}, file.File_Dir{1}, file.First_Upload_dt{2}, user.Usertag{3}, file.Last_Modified_dt{4}, file.Current_Size{5}, version.Version_Size{6}, version.Version_Dir{7}, version.Version_Date{8} FOR each file for a given repository					
						for($i = 0;$i < count($commits);++$i)
						{
							$ver_dir = substr($commits[$i][7], 0, strpos($commits[$i][7], ".luft"));
							echo "<tr><td><a href=".$commits[$i][7]." target='_blank' download='$ver_dir'>".$commits[$i][1]."</a></td><td>".$commits[$i][3]."</td><td>".$commits[$i][8]."</td><td>".$commits[$i][6]."</td><tr>";	
						}
					?>
					</table>
				</form>
			</article>			
		</section>

	</body>
</html>