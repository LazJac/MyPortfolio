<!doctype html>

<!--Sessions that NEED to exist
		*$_SESSION["UserID"]
-->
<!--Sessions that CAN MAYBE exist
		*$_SESSION["Usertag"]
		*$_SESSION["User_Email"]
		*$_SESSION["User_Password"]
		
		*$_SESSION["Selected_Repo_ID"]
		*$_SESSION["Selected_Repo"]
		
		*$_SESSION["Commits"]
-->

<?php
	require "php\Security.php";
	require "php\Sql.php";
	
	session_start(); 
	
	$userid = $_SESSION["UserID"]; //set to var for easy use in 'CallQueryArray()'
	if (isset($userid)) 
	{
		$selectedRepoId = $selectedRepoName = "";
		
		
		$rows = CallQueryArray("CALL view_account_info('$userid')"); 
		//get account info, format of a row: Repo_ID, Usertag, User_Email, User_Password, Repo_name(s)
		//$rows[row][column]
		
		if (empty($rows))  //At least 1 repository needs to be made first
		{
			header("Location:FirstRepo.php");
			die();
		}

		$_SESSION["Usertag"]=$rows[0][1];
		$_SESSION["User_Email"]=$rows[0][2];
		$_SESSION["User_Password"]=$rows[0][3];
		
		$repo = Array();
			for ($i = 0;$i < count($rows);++$i)
			{
				$repo[$i] = $rows[$i][4];
				$repoID[$i] = $rows[$i][0];  //Repo_ID's will not be stored is session, but used later
			}
			
			
			if (isset($_SESSION["Selected_Repo_ID"]))
			{
				$selectedRepoId = $_SESSION["Selected_Repo_ID"];
				$selectedRepoName = $_SESSION['Selected_Repo'];
			}
			else
			{
				$_SESSION["Selected_Repo_ID"] = $selectedRepoId = $repoID[0]; //Always start with first repository
				$_SESSION['Selected_Repo'] = $selectedRepoName = $repo[0];
			}

		
	
		$item = Array(); //List of repositories 
		for($i = 0;$i < count($repo);++$i)
		{
			$item[$i] = "<input type='submit' name='btn".$repo[$i]."' value='".$repo[$i]."'><br>";
		} 	
		
		
//#####################################SUBMIT SECTION###########################################

		
		$create = $errCreate = $errUpload = "";
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

					echo "<meta http-equiv='refresh' content='0'>";
				}				
			}
		
			
			$tel = 0; 
			while(count($repo) > $tel)
			{
				if (isset($_POST['btn'.$repo[$tel].'']))
				{
					$_SESSION["Selected_Repo_ID"] = $selectedRepoId = $repoID[$tel];
					$_SESSION['Selected_Repo'] = $selectedRepoName = $repo[$tel];
					break;
				}
				++$tel;
			}
			
			if(isset($_POST['btnUpload']))
			{
				$name = $_FILES["fileUpload"]["name"];
				$name = str_replace(" ","_",$name);
				$size = $_FILES["fileUpload"]["size"]; 
				$size = strval($size);
				$size = $size." KB";
				
				$temp_name = $_FILES["fileUpload"]["tmp_name"];
				$temp_ver_name = $temp_name;
				
				if (isset($name))
				{
					if (!empty($name))
					{
						$currentRepo = $_SESSION['Selected_Repo'];
						$location = "repositories/".$currentRepo."/";
						if (!file_exists($location))
						{
							mkdir($location, 0777, true);	
						}
						$dir = $location.$name;
						
						$verLocation = "versions/".$currentRepo."/";
						if (!file_exists($verLocation))
						{
							mkdir($verLocation, 0777, true);	
						}
						$ver_dir = $verLocation.$name;
						
						
						//echo $selectedRepoId." + ".$userid." + ".$dir." + ".$ver_dir." + ".$size;
						$finalVerDir = CallQueryArray("CALL create_file('$selectedRepoId','$userid','$dir','$ver_dir','$size')");											
						
						if (move_uploaded_file($temp_name,$location.$name))
						{
							$errUpload = "Uploaded";
						}
						else
						{
							$errUpload = "An error happened while uploading this file";
						}
						
						copy ($dir, $finalVerDir[0][0]);
					}
				}
				
			}
		}
		
//################################END OF SUBMIT SECTION########################################
		
		
		$fileItems = CreateFiles($selectedRepoId); //Create a list of repository's file and meta data
		
		$files = Array();
		for($i = 0;$i < count($fileItems);++$i)
		{
			$files[$i] = "<tr><td><a href=".$fileItems[$i][1]." download>".$fileItems[$i][1]."</a></td><td>".$fileItems[$i][2]."</td><td>".$fileItems[$i][3]."</td><td>".$fileItems[$i][4]."</td><td>".$fileItems[$i][5]."</td></tr>";
		}
		
	}
	else
	{
		header("Location:Homepage.php");
		die();
	}
	
	function CreateFiles($currentRepoNr)
	{
		$ID = $currentRepoNr;
		$commits = CallQueryArray("CALL view_commits_per_repo('$ID')"); //Display: file.File_ID{0}, file.File_Dir{1}, file.First_Upload_dt{2}, user.Usertag{3}, file.Last_Modified_dt{4}, file.Current_Size{5}, version.Version_Size{6}, version.Version_Dir{7}, version.Version_Date{8} FOR each file for a given repository

		$_SESSION["Commits"] = $commits;
		
		sort($commits); 	//$commits is ORDERED BY modified date, so use 'sort()' to order it by File_ID

		$files = Array(); 		//Create a list of files form all the Commits
		$temp = -1;
		$tel = 0;
		for($i = 0;$i < count($commits);++$i)  //Remove duplicate files, only use the most resent modified commit of each file  
		{
			if ($commits[$i][0] > $temp)
			{
				$files[$tel] = $commits[$i];
				$temp = $commits[$i][0];
				++$tel;
			}
		}
		return $files;
	}

?>

<html lang="en">
	
	<head>
		<meta charset="utf-8"/>
		<title>LuftGrid - Project</title>
		<link rel="stylesheet" href="css/mainStyles.css">
	</head>

	
	<body>
		<header>
			<h1>LuftGrid: <?php echo substr($rows[0][1],0,strpos($rows[0][1],"#"));//set usertag without the # code at the end ?>'S PROFILE</h1>     
		</header>
		
		<nav>
			<div id="main">
			  <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; </span>
			</div>
		</nav>

		<div id="mySidenav" class="sidenav">
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			<a href="javascript:void(0)" onclick="closeNav()">Source</a>
			<a href="CommitsPage.php">Commits</a>
			<a href="ReportPage.php">Report Issues</a>
			<a href="SettingsPage.php">Settings</a>
			<a href="HomePage.php">Logout</a>
		</div>
		
		<script type="text/javascript" src="java/navFunc.js"></script> <!-- Allow use of 'closeNav()' and 'openNav()' for a javascript file-->
		
		<section> 
			<article id="d1_scr" class="framItems">
				<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" >    
					<h2>Create new repository:</h2>
						<input type="text" name="txtRepo">
						<span class="error"><?php echo $errCreate; ?></span><br>
					<h3>Repsoitory is:</h3>
						<input type="radio" name="isPrivate" value="Public" checked>Public<br>
						<input type="radio" name="isPrivate" value="Private">Private<br><br>
					<input type="submit" name="btnCreateRepo" value="Create">
				</form>
			</article>
		</section> 
		
		<section>      
			<article id="d1_scr" class="framItems">
				<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" >    
					<h2>Repository list:</h2>
					<?php
						for($i = 0;$i < count($item);++$i)
						{
							echo $item[$i];
						}				
					?>
				</form>
			</article>
		</section>
		<section>      
			<article id="d1_scr" class="framItems">
				<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" >    
					<h2>Explorer</h2>
					<label>:\\
					<?php 
					echo $selectedRepoName;
					?>
					\..</label><br> 
					
					<table style="width:100%">
					<tr>
						<td>Repository</td>
						<td>First Uploaded</td>
						<td>Uploaded by</td>
						<td>Last Modified</td>
						<td>File Size</td>
					</tr>
					<?php
					
						for($i = 0;$i < count($files);++$i)
						{
							echo $files[$i];
						}
					?>
					</table>
					
				</form>
				<footer>
					<label style="color: #30b6ee">Click a file to download it</label>
				</footer>
			</article>
		</section>
		<section>      
			<article id="d1_scr" class="framItems">
				<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" enctype="multipart/form-data">    
					<input type="file" name="fileUpload" value="Choose File">
					<span class="error"><?php echo $errUpload; ?></span><br>
					<input type="submit" name="btnUpload" value="Upload">
				</form>
			</article>
		</section>

	</body>
</html>