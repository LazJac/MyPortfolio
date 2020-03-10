<?php
	
	function CallQuery($command) //Run this method if you only want to call a sql stored function
	{
		$connection = new mysqli("35.233.100.111","root","pass1234","LuftGrid");	
		if ($connection->connect_error)     //Test connection
		{
			die("Connection failed: " . $connection->connect_error); 
		}
		
		$result = mysqli_query($connection,$command) or die("Connection failed: " . $connection->connect_error);
		
		mysqli_close($connection) or die("Close failed: " . $connection->connect_error);
		
		return $result; 	//Only returns for the sake of CallQueryArray
	}
	
	function CallQueryArray($command) //Run this method if you want to call a sql stored function that return table data(one or more rows)
	{
		$result = CallQuery($command);
		
		$tel = 0;
		$rows = Array();
		while($row = mysqli_fetch_array($result))
		{
			$rows[$tel] = $row;
			++$tel;
		}
		
		return $rows; //change the SELECT query result, into a readable 2D array; $rows[row][column]
	}

?>





