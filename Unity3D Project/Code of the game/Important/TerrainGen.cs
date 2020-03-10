using UnityEngine;
using System.Collections;
using Random = UnityEngine.Random;

public class TerrainGen : MonoBehaviour {

	public GameObject[] basementSecondFloor ,bSFRooms;
	public GameObject[] basementFloor ,bFRooms;
	public GameObject[] groundFloor ,gFRooms;
	public GameObject[] firstFloor ,f1Rooms;
	public GameObject[] secondFloor ,f2Rooms;
	public GameObject[] thirdFloor ,f3Rooms;
	public GameObject[] fourthFloor ,f4Rooms;
	public GameObject[] fifthFloor ,f5Rooms;
	public GameObject[] sixthFloor ,f6Rooms;
	public GameObject[] seventhFloor ,f7Rooms;
	public GameObject[] eigthFloor ,f8Rooms;
	public GameObject[] nightFloor ,f9Rooms;
	
	public static int level ,roomTipe ,anyNumber ,seed;
	public EnemyGen enemyScript;
	public static float newPos;
	public static bool endTerrian;

	private int t_min ,t_max ,conner;
	private Vector2 position;

	public void FirstBuild(int Level)  //GEROEP deur "SeedGen" voor "Enter"
	{
		level = Level;
		roomTipe = 0;
		NewTerrain (level,0,SeedGen.levelSeeds[level - 1],0);
	}
	
	public void NewTerrain (int Level,int RoomTipe,int Seed,int Conner) //Roomtipe ~ 0 = hall ; 1 = room
	{
		conner = Conner;
		seed = Seed;
		endTerrian = false;
		level = Level;
		roomTipe = RoomTipe;
		switch (level) 	   		                                 
		{
		case 1: 
			if(roomTipe != 1)
				PlaceTerrian (basementSecondFloor,10,20);
			else
				PlaceTerrian (bSFRooms,1,1);
			break;
		case 2:
			if(roomTipe != 1)
				PlaceTerrian (basementFloor,8,16);
			else
				PlaceTerrian (bFRooms,1,1);
			break;
		case 3:
			if(roomTipe != 1)
				PlaceTerrian (groundFloor,5,18);
			else
				PlaceTerrian (gFRooms,1,1);
			break;
		case 4:
			if(roomTipe != 1)
				PlaceTerrian (firstFloor,4,14);
			else
				PlaceTerrian (f1Rooms,1,1);
			break;
		case 5:
			if(roomTipe != 1)
				PlaceTerrian (secondFloor,3,8);
			else
				PlaceTerrian (f2Rooms,1,1);
			break;
		case 6:
			if(roomTipe != 1)
				PlaceTerrian (thirdFloor,2,6);
			else
				PlaceTerrian (f3Rooms,1,1);
			break;
		case 7:
			if(roomTipe != 1)
				PlaceTerrian (fourthFloor,1,4);
			else
				PlaceTerrian (f4Rooms,1,1);
			break;
		case 8:
			if(roomTipe != 1)
				PlaceTerrian (fifthFloor,1,4);
			else
				PlaceTerrian (f5Rooms,1,1);
			break;
		case 9:
			if(roomTipe != 1)
				PlaceTerrian (sixthFloor,1,4);
			else
				PlaceTerrian (f6Rooms,1,1);
			break;
		case 10:
			if(roomTipe != 1)
				PlaceTerrian (seventhFloor,1,4);
			else
				PlaceTerrian (f7Rooms,1,1);
			break;
		case 11:
			if(roomTipe != 1)
				PlaceTerrian (eigthFloor,1,4);
			else
				PlaceTerrian (f8Rooms,1,1);
			break;
		case 12:
			if(roomTipe != 1)
				PlaceTerrian (nightFloor,1,4);
			else
				PlaceTerrian (f9Rooms,1,1);
			break;
		}
	}

	public void RandomNumber (int minimum, int maximum)
	{
		anyNumber = Random.Range (minimum, maximum);
	}

	private void PlaceTerrian (GameObject[] terrian, int b_min, int b_max )
	{
		Random.seed = seed;          //Door se nr.
		
		seed = Random.seed; //Toets
		
		RandomNumber (b_min, b_max);
		position = new Vector2 (0f,0f);
		newPos = 0.0f;
		int tel = 0;
		int repeat = anyNumber;
		
		if (conner == 0)
		{
			if (roomTipe == 0)
				repeat += 2;
			else
				tel = repeat = 1;
		}
		else
			repeat = 1;
		
		for (int i = 0 ;i < repeat ;i++)
		{
			if (roomTipe == 0)
			{
				if (i == 0 || i == repeat)
					tel = i == 0 ? 0 : 1;
				else
				{
					t_min = 2;		//bv. 7 Verskillende tipe coners = begin dan met 7(t_min = 7)
					t_max = terrian.Length;
					RandomNumber (t_min, t_max);
					tel = anyNumber;
				}
			}
			position = new Vector2 (position.x + terrian[tel].GetComponent<BoxCollider2D>().size.x, 0f);
			newPos = position.x + (terrian [tel].GetComponent<BoxCollider2D> ().size.x / -2);
			Instantiate(terrian[tel],new Vector2(newPos,0f),Quaternion.identity);
		}
		endTerrian = true;
		enemyScript.EnemyPos();
	}


//	private void PlaceTerrian (GameObject[] terrian, int b_min, int b_max )         
//	{
//		Random.seed = seed;          //Door se nr.
//
//		seed = Random.seed; //Toets
//
//		RandomNumber (b_min, b_max);
//		position = new Vector2 (0f,0f);
//		newPos = 0.0f;
//		int repeat = anyNumber;
//
//		if (conner == 0)
//		{
//			if (roomTipe == 0)
//			{
//				//3 Verskillende tipe coners bv
//				position = new Vector2 (position.x + terrian[0].GetComponent<BoxCollider2D>().size.x, 0f);
//				newPos = position.x + (terrian [0].GetComponent<BoxCollider2D> ().size.x / -2);
//				Instantiate (terrian [0], new Vector2 (newPos, 0f), Quaternion.identity);
//				
//				for (int i = 0; i < repeat; i++)
//				{
//					t_min = 2;		//3 Verskillende tipe coners bv = begin dan met 4
//					t_max = terrian.Length;
//					RandomNumber (t_min, t_max);
//					
//					position = new Vector2 (position.x + terrian[anyNumber].GetComponent<BoxCollider2D>().size.x, 0f);
//					newPos = position.x + (terrian[anyNumber].GetComponent<BoxCollider2D>().size.x/-2);
//					Instantiate(terrian[anyNumber],new Vector2(newPos,0f),Quaternion.identity); 
//				}
//
//				//3 Verskillende tipe coners bv
//				position = new Vector2 (position.x + terrian[1].GetComponent<BoxCollider2D>().size.x, 0f);
//				newPos = position.x + (terrian [1].GetComponent<BoxCollider2D> ().size.x / -2);
//				Instantiate(terrian[1],new Vector2(newPos,0f),Quaternion.Euler(0,180,0));
//			}
//			else
//			{
//				position = new Vector2 (position.x + terrian[1].GetComponent<BoxCollider2D>().size.x, 0f);
//				newPos = position.x + (terrian[1].GetComponent<BoxCollider2D>().size.x/-2);
//				Instantiate(terrian[1],new Vector2(newPos,0f),Quaternion.identity); 
//			}
//		}
//		else
//		{
//			position = new Vector2 (position.x + terrian[0].GetComponent<BoxCollider2D>().size.x, 0f);
//			newPos = position.x + (terrian [0].GetComponent<BoxCollider2D> ().size.x / -2);
//			Instantiate(terrian[0],new Vector2(newPos,0f),Quaternion.identity);
//		}
//		endTerrian = true;
//  	enemyScript.EnemyPos();
//	}

}



















