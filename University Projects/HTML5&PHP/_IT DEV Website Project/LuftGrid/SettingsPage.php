<!doctype html>

<!--Sessions that NEED to exist
		*$_SESSION["UserID"]
		
		*$_SESSION["Usertag"]
		*$_SESSION["User_Email"]
		*$_SESSION["User_Password"]
		
		*$_SESSION["Selected_Repo_ID"]
-->
<!--Sessions that CAN MAYBE exist
		*$_SESSION['Selected_Repo']
		
		*$_SESSION["Commits"]
-->

<?php
	require "php\Security.php";
	require "php\Sql.php";
	

	session_start();	

	$userid = $_SESSION["UserID"];  //set for reuse
	$usertag = $_SESSION["Usertag"];
	
	if (isset($userid) && isset($usertag)) 
	{
		$userEmail = $_SESSION["User_Email"];
		$UserPassword = $_SESSION["User_Password"];
		
		//#####################################SUBMIT SECTION###########################################
		
		$newEmail = $newPassword = $newCPassword = $repoName = $errJoin = $inviteMess = $errEmail = $errPass = $errCPass = $updateMess = "";

		if ($_SERVER["REQUEST_METHOD"] == "POST")		//Do this after "submit"
		{
			
			if (isset($_POST['btnProjeckJoin']))
			{
				$errJoin = ($repoName = TestInput($_POST['txtProjeckJoin'],0,0,44)) === -1 ? getErrorMessage() : "";
				if ($repoName === -1)
				{
					$repoName = "";
				}
				else
				{
					$repoID = CallQueryArray("CALL search_repo('$repoName')");
					
					if ($repoID != null)
					{
						$member = CheckInvites();
					
						$ID = $repoID[0][0];
						CallQuery("CALL create_member_invite('$ID','$userid')");
						$errJoin = "Invite made"; 
					}
					else
					{
						$errJoin =  "*Repository does not exist"; 
					}
				}						
			}
			
			if (isset($_POST['btnAccept']))
			{
				$member = CheckInvites();
				
				CallQuery("CALL update_accept_invite('$member[0]')");
				$inviteMess = "Member added"; 
			}
			
			if (isset($_POST['btnReject']))
			{
				$member = CheckInvites();
				
				CallQuery("CALL delete_reject_invite('$member[0]')");
				$inviteMess = "Member rejected"; 
			}
			
			
			if (isset($_POST['btnSaveChanges']))
			{

				$errEmail = ($newEmail = TestInput($_POST["txtChangeEmail"],3,0,0)) === -1 ? getErrorMessage() : ""; 
				$errPass = ($newPassword = TestInput($_POST["txtchange_Password"],2,6,44)) === -1 ? getErrorMessage() : "";
				$errCPass = ($newCPassword = TestInput($_POST["txtchange_cPassword"],2,6,44)) === -1 ? getErrorMessage() : "";
				
				if ($newEmail === -1 && $newPassword === -1)
				{
					$updateMess = "no changes made";
				}
				else
				{
					if ($newEmail != -1)
					{
						if ($newEmail != $userEmail )
						{
							CallQuery("CALL update_user_email('$userid','$newEmail')");//update email
							$updateMess = "Email changed";
							$_SESSION["User_Email"] = $newEmail;
							$userEmail = $newEmail;
						}
						else
						{
							$updateMess = "Email already exists";
						}
					}
					
					if ($newPassword != -1)
					{
						if ($newPassword == $newCPassword)
						{
							$md5newPassword = md5($newPassword);
							if ($md5newPassword != $UserPassword)
							{
								CallQuery("CALL update_user_password('$userid','$md5newPassword')");///change password
								$updateMess = "Password changed";
								$_SESSION["User_Password"] = $md5newPassword;
								$UserPassword = $md5newPassword;
							}
							else
							{
								$updateMess = "New password is the same as old password";
							}
						}
						else
						{
							$updateMess = "Please confirm your password to be the same as you new password";
						}
					}
					$_POST['txtChangeEmail'] = "";
					
				}
			}
			
			if (isset($_POST['btnDelete'])) //if btnDelete is clicked
			{
				CallQuery("Call delete_user('$userid')"); 	//Delete current logged-in user
				session_unset();
				header("Location:HomePage.php"); 	//return to HomePage(the login page)
				die();
			}
		}
	}
	else
	{
		header("Location:Homepage.php");
		die();
	}
	
	function CheckInvites()
	{
		$selectedRepo = $_SESSION["Selected_Repo_ID"];
		$inviteList = CallQueryArray("CALL view_pending_invites('$selectedRepo')");
		
		$invite = Array("","");  
		if ($inviteList != null)
		{
			$invite = $inviteList[0];
		}
		return $invite;  //Sends back first Member with a PENDING status in format of: Array(['Member_ID'],Member's ['Usertag']) 
	}

?>

<html lang="en">
	
	<head>
		<meta charset="utf-8"/>
		<title>Settings</title>
		<link rel="stylesheet" href="css/mainStyles.css">
	</head>

	
	<body id="loginscr">
		<header>
			<h1>Settings</h1>     
		</header>
		
		<nav>
			<div id="main">
			  <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; </span>
			</div>
		</nav>

		<div id="mySidenav" class="sidenav">
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			<a href="SourcePage.php">Source</a>
			<a href="CommitsPage.php">Commits</a>
			<a href="ReportPage.php">Report Issues</a>
			<a href="javascript:void(0)" onclick="closeNav()">Settings</a>
			<a href="HomePage.php">Logout</a>
		</div>
		
		<script type="text/javascript" src="java/navFunc.js"></script>   <!-- Allow use of 'closeNav()' and 'openNav()' for a javascript file-->


		<section>   
			<article class="framItems">
				<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" >    
					<h2>Join a project:</h2>
						<input type="text" name="txtProjeckJoin"><br>
					<input type="submit" name="btnProjeckJoin" value="Search">
					<span class="error"><?php echo $errJoin; ?></span>
				</form>
			</article>
			
			<article class="framItems">
				<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" >    
					<label id="lblMember"><?php $invite = CheckInvites(); echo $invite[1] != null ? $invite[1]." wants to join your team!
						<input type='submit' name='btnAccept' value='Accept'>
						<input type='submit' name='btnReject' value='Reject'>" : ""; ?></label>   <!--Text + Buttons only visible if any members are PENDING-->
						<span class="error"><?php echo $inviteMess; ?></span><br>
				</form>
			</article>
		
			<article class="framItems">
				<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" >    
					<h2>Change:</h2>
					<label id="lblEmail">Email:</label>
						<input type="text" name="txtChangeEmail" value="" placeholder=" <?php echo $userEmail; ?> ">
						<span class="error"><?php echo $errEmail; ?></span><br><br> 
					<label id="lblPassword">Change Password:</label>
						<input type="password" name="txtchange_Password" value=""> 
						<span class="error"><?php echo $errPass; ?></span>
						<input type="password" name="txtchange_cPassword" value="" placeholder="confirm password">
						<span class="error"><?php echo $errCPass; ?></span><br><br> 
					<input type="submit" name="btnSaveChanges" value="Save">
					<span class="error"><?php echo $updateMess; ?></span>
				</form>
			</article>
			
			<article class="framItems">
				<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
					<input type="submit" name="btnDelete" value="Delete Account">
				</form>
			</article>
			
		</section>

	</body>
</html>