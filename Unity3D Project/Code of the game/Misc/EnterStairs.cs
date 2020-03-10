using UnityEngine;

public class EnterStairs : MonoBehaviour {
	
	public Enter stairEnter;
	
	private int xHori,yVert,seedNr,tempLevel;
	
	void Start()
	{
		GameObject seed = GameObject.Find ("GenScripts");
		stairEnter = seed.GetComponent<Enter>();
	}
	
	void OnTriggerStay2D (Collider2D other)
	{
		if (other.tag == "Player")
		{
			if (Input.GetKeyDown("e"))
			{
				if (this.tag == "LU" || this.tag == "LD")
					xHori = 1;
				else
					xHori = 2;
				if (this.tag == "LU" || this.tag == "RU")
				{
					yVert = 2;
					tempLevel = TerrainGen.level + 1;
				}
				else
				{
					yVert = 3;
					tempLevel = TerrainGen.level - 1;
				}
					
				SeedGen.temp = -1;
				seedNr = SeedGen.levelSeeds[tempLevel - 1];
				stairEnter.Entering(yVert,xHori,seedNr,0,0,0);  
			}
		}
	}
}
