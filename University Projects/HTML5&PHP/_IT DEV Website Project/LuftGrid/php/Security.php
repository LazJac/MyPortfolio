<?php
	
	$errormessage = "";
	
	function TestInput($data,$type,$min_lenght,$max_lenght)
	{
		global $errormessage;
		
		if(empty($data))
		{
			$errormessage = "*Field can't be left empty";
			
			if ($type == 2 || $type == 3)
			{
				$errormessage = "";
			}			
			return -1;	
		}
		else
		{
			if ($type == 1 || $type == 3)
			{
				if (!filter_var($data, FILTER_VALIDATE_EMAIL))
				{
					$errormessage = "*Invalid format of an email";
					return -1;
				}
			}
			$data = trim($data);
			$data = stripslashes($data);
			$data = htmlspecialchars($data);

			if ($type == 0 || $type == 2)
			{
				if (strlen($data) < $min_lenght || strlen($data) >= $max_lenght)
				{
					$errormessage = "*The length of this field needs to be more then ".$min_lenght." and less then ".$max_lenght;
					return -1;
				}
			}
		}
		
		return $data;
	}
	
	function getErrorMessage()
	{
		global $errormessage;
		
		return $errormessage;
	}

?>