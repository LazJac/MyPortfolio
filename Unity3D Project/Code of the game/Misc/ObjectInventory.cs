using UnityEngine;

public class ObjectInventory : MonoBehaviour {

	void OnTriggerStay2D (Collider2D other)  //MAAK DAT HY NET EEN KEER ROEP EN OU INLIGTING HOU
	{
		if (other.tag == "Player")
			if (Input.GetKey("i"))
				StartMenu.startMenu.ItemSpawn(false);
	}
}
