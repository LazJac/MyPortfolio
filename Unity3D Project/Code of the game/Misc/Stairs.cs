using UnityEngine;

public class Stairs : MonoBehaviour {
	
	public EdgeCollider2D stairs ,down;
	
	void OnTriggerStay2D (Collider2D other)
	{
		if (other.tag == "Player")
		{
			if (Input.GetKey("q"))  
			{
				stairs.isTrigger = false;
				down.isTrigger = false;
			}
		}
	}
	
	void OnTriggerEnter2D (Collider2D other)
	{
		stairs.isTrigger = true;
		down.isTrigger = true;
	}
}
