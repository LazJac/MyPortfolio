using UnityEngine;

public class Enter : MonoBehaviour {

	public Player playerScript;
	public TerrainGen terrainScript;
	public int level,roomtipe,temp;

	public void SetPlayer() //GEROEP deur "SeedGen" na "TerrainGen"
	{
		GameObject play = GameObject.Find ("Player");
		playerScript = play.GetComponent<Player>();
		playerScript.playerAwake();
	}

	public void Entering(int Tipe,int Dir,int Seed,int DoorNumber,int Negative,int Conner)  //Tipe ~: 1=Door ,2=UP ,3=Down 
	{
		GameObject[] terrains = GameObject.FindGameObjectsWithTag ("Terrain");
		foreach (GameObject terrain in terrains)
			Destroy (terrain);

		switch (Tipe) {
		case 1: 
			level = TerrainGen.level;
			roomtipe = TerrainGen.roomTipe == 0 ? 1 : 0;
			break;
		case 2:
			level = TerrainGen.level + 1;
			roomtipe = 0;
			break;
		case 3:
			level = TerrainGen.level - 1;
			roomtipe = 0;
			break;
		}
		terrainScript.NewTerrain (level, roomtipe, Seed, Conner); 
		if (Tipe != 1) 
		{
			playerScript.StairsPos (Dir,DoorNumber);
		}
		else 
		{
			if (TerrainGen.roomTipe == 0)
			{
				playerScript.DoorPos (DoorNumber, Negative);
			}
			else
			{
				playerScript.StairsPos (Dir,DoorNumber);
			}
		}
	}
}
