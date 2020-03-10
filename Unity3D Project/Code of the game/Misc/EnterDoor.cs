using UnityEngine;

public class EnterDoor : MonoBehaviour {
	
	public Enter enter;
	public Vector2 doorPosition;
	public int doorSeed ,doorNr ,negative ,dirX;

	void Start()
	{
		GameObject other = GameObject.Find ("GenScripts");
		enter = other.GetComponent<Enter>();

		doorPosition = new Vector2 (transform.position.x,0);

		if (TerrainGen.roomTipe == 0) 
		{
			doorNr = SeedGen.temp + 2;

			if (TerrainGen.seed > 0)
			{
				doorSeed = SeedGen.SeedCall (doorPosition,1);
				negative = 1;
				dirX = 1;
			}
			else
			{
				doorSeed = SeedGen.SeedCall (doorPosition,2);
				negative = 2;
				dirX = 2;
			}
		}
		else 
		{
			SeedGen.temp = -1;
			doorNr = Player.doorNr;

			if (this.tag == "RightDoor") 
			{
				doorSeed = SeedGen.levelSeeds [TerrainGen.level - 1];
				doorSeed /= -1;
				negative = 2;
			}
			else
			{
				doorSeed = SeedGen.levelSeeds [TerrainGen.level - 1];
				negative = 1;
			}
		}
	}

	void OnTriggerStay2D (Collider2D other)
	{
		if (other.tag == "Player")
		{
			if (Input.GetKeyDown("w"))  
			{
				if (this.tag == "Conner")
				{
					enter.Entering(1,dirX,doorSeed,doorNr,negative,1);
				}
				else
				{
					enter.Entering(1,dirX,doorSeed,doorNr,negative,0);
				}
			}
		}
	}
}
