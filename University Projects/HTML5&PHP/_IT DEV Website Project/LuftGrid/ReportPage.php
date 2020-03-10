<!doctype html>

<!--Sessions that NEED to exist
		*$_SESSION["UserID"]
		
		*$_SESSION["Usertag"]
		
		*$_SESSION["Selected_Repo_ID"]
		
-->
<!--Sessions that CAN MAYBE exist
		*$_SESSION["User_Email"]
		*$_SESSION["User_Password"]
		
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
		
//#####################################SUBMIT SECTION###########################################
		
		$message = $errChat = "";

		if ($_SERVER["REQUEST_METHOD"] == "POST")		//Do this after "submit"
		{
			$errChat = ($message = TestInput($_POST['txtChat'],0,0,224)) === -1 ? getErrorMessage() : "";
			
			if ($message === -1)
			{
				$message = "";
			}
			else
			{
				CallQuery("CALL create_chat_message('$userid','$message')");
			}
		}
	}
	else
	{
		header("Location:Homepage.php");
		die();
	}
	
	function SetChat()
	{
		$repo = $_SESSION["Selected_Repo_ID"];
		$chatArray = CallQueryArray("CALL view_group_chat('$repo')"); //Display: chat.Chat_Date,chat.Chat_Time, user.Usertag, chat.Chat_Message 
		
		$chat = Array("");
		for($i = 0;$i < count($chatArray);++$i)
		{
			$chat[$i] = "".$chatArray[$i][0]."@ ".$chatArray[$i][1]." >> ".$chatArray[$i][2].": ".$chatArray[$i][3]."";
		}
	
		return $chat;
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
			<h1>Group Chat</h1> 		
		</header>
		
		<nav>
			<div id="main">
			  <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; </span>
			  <?php
				$time = 1000;
			  ?>
			</div>
		</nav>

		<div id="mySidenav" class="sidenav">
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			<a href="SourcePage.php">Source</a>
			<a href="CommitsPage.php">Commits</a>
			<a href="javascript:void(0)" onclick="closeNav()">Report Issues</a>
			<a href="SettingsPage.php">Settings</a>
			<a href="HomePage.php">Logout</a>
		</div>
		
		<script type="text/javascript" src="java/navFunc.js"></script>   <!-- Allow use of 'closeNav()' and 'openNav()' for a javascript file-->


		<section>      
			<article id="d2_scr" class="framItems">
				<form id="chatbox" method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" >    <!--This form will refresh continentally-->
					<h3>Report any problems to you team:</h3>
						<input type="text" name="txtChat" >
						<span class="error"><?php echo $errChat; ?></span><br>
					<input type="submit" name="btnSend" value="Send"><br>
					<textarea rows="20" cols="100" align="left" readonly>
					Welcome to chat
					<?php 
						$chatList = SetChat();
						echo "&#13;&#10;";

						for($i = 0;$i < count($chatList);++$i)
						{
							echo $chatList[$i]."&#13;&#10;";
						}
					?>
					</textarea><br>
				</form>
			</article>

			<script>
				$("#chatbox").load(document.URL +  " #chatbox");  <!--Script for only refreshing a single part of a page, I'm doing this instead of refreshing the whole page, because doing so messes with the left select panel-->
			</script>
		</section>
	</body>
</html>