using System;
using UnityEngine;
using System.Collections;

public class SeedGen : MonoBehaviour{

	//public int mainSeed;

	public static int temp;
	public bool resumeGame;
	public Enter enterScript;
	public TerrainGen terrian;
	public static int[] levelSeeds ,doorSeeds;
	public static Vector2[,] levelPos = new Vector2[12,20];		//vb. [4,2] = {{2,6},{3,8},{3,6},{9,3}};
	public static Vector2[,] levelNegPos = new Vector2[12,20];
	public string seed = null;

	public void Awake()
	{
		int level = 2;
		resumeGame =  StartMenu.startMenu.resumeMenu;

		if (resumeGame)
		{
			seed = StartMenu.startMenu.loadInfoGame[0].ToString(); 
			level = (int)StartMenu.startMenu.loadInfoGame[1];
			//level = 3;  //LEVEL TESTER
		}
		else
		{
			seed = Time.time.ToString();
		}

		System.Random seedR = new System.Random(seed.GetHashCode());

		StartMenu.startMenu.loadInfoGame[0] = double.Parse(seed) ;

		levelSeeds = new int[12]; 
		doorSeeds = new int[20]; 
		for (int i = 0;i < 12; i++)
		{
			levelSeeds[i] = seedR.Next(111111111,999999999);
		}
		for (int i = 0;i < 20; i++)
		{
			doorSeeds[i] = seedR.Next(111111111,999999999); 
		}
		terrian.FirstBuild(level);
		enterScript.SetPlayer();
		temp = -1;
	}

	public static int SeedCall(Vector2 DoorPosition,int Negative)   //1 = seed ; 2 = -seed
	{
		temp += 1;
		int level = TerrainGen.level - 1;
		if (Negative == 1)
		{
			if (levelPos[level,temp].x == 0)
			{
				levelPos[level,temp] = DoorPosition;
			}
		}
		else
		{
			if (levelNegPos[level,temp].x == 0)
			{
				levelNegPos[level,temp] = DoorPosition;
			}
		}
		return doorSeeds[temp];
	}
}
