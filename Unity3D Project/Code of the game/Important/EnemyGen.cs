using UnityEngine;
using System.Collections;

public class EnemyGen : MonoBehaviour {

	public GameObject[] enemies;
	public TerrainGen terrian;
	public int tempPos;

	private int enemLength ,newPosI ,enemRate ,minEnem ,enemyNumber ,enemNr;
	private Vector2 enemPos;

	public void EnemyPos() 
	{
		if ( TerrainGen.endTerrian == true ) 
		{
			tempPos = 0;
			newPosI = (int)Mathf.CeilToInt(TerrainGen.newPos);
			enemRate = (int)Mathf.CeilToInt(newPosI)/15;   //Hoeveel enemies per ?? unints
			enemRate = enemRate == 0 ? 1:enemRate;
			minEnem = enemRate == 1 ? 0:1;
			terrian.RandomNumber(minEnem ,enemRate);
			enemyNumber = TerrainGen.anyNumber; 

			for ( int i = 0; i < enemyNumber; i++ )
			{
				if (i != 0)
					tempPos = enemLength;

				enemNr = enemies.Length;
				terrian.RandomNumber(0,enemNr);
				enemNr = TerrainGen.anyNumber;

				terrian.RandomNumber(0,newPosI);
				enemLength = TerrainGen.anyNumber;

				enemPos = new Vector2 (enemLength,0.5f);
				Instantiate(enemies[enemNr], enemPos, Quaternion.identity);
			}
		}
	}
}
