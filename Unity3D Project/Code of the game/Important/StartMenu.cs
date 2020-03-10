using System;
using System.IO;
using UnityEngine;
using UnityEngine.UI;
using System.Collections.Generic;
using UnityEngine.SceneManagement;
using Random = UnityEngine.Random;
using System.Runtime.Serialization.Formatters.Binary;

[Serializable]
class SaveData
{
	public double[] loadInfo;
	public List<ItemClass>[] loadList;
}

public class StartMenu : MonoBehaviour {

	public double[] loadInfoGame = new double[3]; 
	public List<ItemClass>[] LoadListGame = new List<ItemClass>[8];
	public static List<ItemClass> weaponsList, armourList, consumablesList, ringsList, upMatList, keysList, shieldList, projecList, inventoryList;//Temp list(inventoryList)

	public GameObject optionsCanves ,resumeCanves ,startCanves ,startmenu_Start ,inventory_Game ,playerInventory_Game ,options_Game;	//"-Canves" = een van 3 scence in die "startmenu_Start"
	public GameObject consPanel, sampleButton;
	public Transform contentPanel;
	public bool resumeMenu;
	public Player player;
	public static StartMenu startMenu;  //ALL die SCRIPTS wat "StartMenu" gebruik, gebruik die var.

	public int sideItemNr, consumSpace = -1; //Nie meer as 10 consumables
	public static ItemClass weapon ,armour ,shield ,projec ,ring;
	public static ItemClass[] hotbar; //NR. van die items in die ITEMSPANEL //Hou tret van watter ITEN waar in die HOTBAR is
	public ItemClass[] items = new ItemClass[5];	


	public Image[] itemPlace = new Image[5];	//IMAGES op die ITEMPANEL
	public Image[] hotbarPlace = new Image[10];	//IMAGES op die HOTBAR 
	public Sprite[] itemImages = new Sprite[8]; //SPRITES wat jy van die items gemaak het + moet later " = new Sprite[8]; " uit haal !!!


	private int typeButton = 0;
	private enum TypeButton {none, weaponButton, armourButton, consButton, ringButton, upMatButton, keysButton, shieldButton, projectButton};

	private void Awake()
	{
		if (startMenu == null)
		{
			DontDestroyOnLoad(gameObject);
			DontDestroyOnLoad(startmenu_Start);
			DontDestroyOnLoad(inventory_Game);
			DontDestroyOnLoad(playerInventory_Game);
			DontDestroyOnLoad(options_Game);
			startMenu = this;
		}
		else if(startMenu != this)
		{
			Destroy(gameObject);
		}
		//Debug.Log(Application.persistentDataPath);
	}

	private void Update()
	{
		if (Application.loadedLevel == 1)
		{
			player.enabled = true;
			startmenu_Start.SetActive(false);
		}
		else
		{
			startmenu_Start.SetActive(true);
		}
		if (Input.GetKeyDown(KeyCode.Escape))
		{
			GameOptions(false);
		}
		if (Input.GetKeyDown(KeyCode.Q))
		{
			PlayerInventory(false);
		}
		if (Input.GetKeyDown(KeyCode.Backspace))
		{
			GameOptions(true);
			PlayerInventory(true);
		}
	}

	public void ButtonSwitch(bool value ,GameObject canvesPanel) //false = true & vicavirsa
	{
		if (value)
		{
			canvesPanel.SetActive(false);
		}
		else
		{
			canvesPanel.SetActive(true);
		}
	}

	//-----------------------------------------------------------------------------------------------START-------------------------------------------------------------------------------------------------------------

	public void StartButtonClicked()
	{
		resumeMenu = false;
		weaponsList = new List<ItemClass>();
		shieldList = new List<ItemClass>();
		consumablesList = new List<ItemClass>();
		upMatList = new List<ItemClass>();
		ringsList = new List<ItemClass>();
		projecList = new List<ItemClass>();
		keysList = new List<ItemClass>();
		armourList = new List<ItemClass>();
		inventoryList = new List<ItemClass>();
		hotbar = new ItemClass[10];
		for (int i = 0;i < 10;i++)
		{
			hotbarPlace[i].sprite = null;
		}
		//Dalk ook direction in LoadInfoGame = 0 ?? <---
		SceneManager.LoadScene(1); 
	}

	//-----------------------------------------------------------------------------------------------RESUME------------------------------------------------------------------------------------------------------------

	public void ResumeButtonClicked(bool Switch)  // resumeMenu = true;
	{
		ButtonSwitch(Switch ,startCanves);
		resumeCanves.SetActive(Switch);
	}

	public void Save()
	{
		loadInfoGame[1] = TerrainGen.level;
		loadInfoGame[2] = Player.direction;
		LoadListGame[0] = weaponsList; 
		LoadListGame[1] = armourList; 
		LoadListGame[2] = consumablesList; 
		LoadListGame[3] = ringsList; 
		LoadListGame[4] = upMatList; 
		LoadListGame[5] = keysList; 
		LoadListGame[6] = shieldList; 
		LoadListGame[7] = projecList;

		BinaryFormatter BiFor = new BinaryFormatter();
		FileStream file = File.Create(Application.persistentDataPath + "/GameInfo.dat");
		SaveData data = new SaveData();
		data.loadInfo = loadInfoGame;
		data.loadList = LoadListGame;
		BiFor.Serialize(file,data);
		file.Close();
	}

	public void LoadProfile()
	{
		resumeMenu = true;
		ResumeButtonClicked(false);
		Load();
		SceneManager.LoadScene(1);
	}

	public void Load()
	{
		if (File.Exists(Application.persistentDataPath + "/GameInfo.dat"))
		{
			BinaryFormatter BiFor = new BinaryFormatter();
			FileStream file = File.Open(Application.persistentDataPath + "/GameInfo.dat",FileMode.Open);
			SaveData data = (SaveData)BiFor.Deserialize(file);
			file.Close();

			loadInfoGame = data.loadInfo;
			LoadListGame = data.loadList;

			weaponsList = LoadListGame[0];
			shieldList = LoadListGame[6];
			consumablesList = LoadListGame[2];
			upMatList = LoadListGame[4];
			ringsList = LoadListGame[3];
			projecList = LoadListGame[7];
			keysList = LoadListGame[5];
			armourList = LoadListGame[1];
			inventoryList = new List<ItemClass>();
		}
		else
		{
			StartButtonClicked();
		}
	}

	//-----------------------------------------------------------------------------------------------OPTIONS-----------------------------------------------------------------------------------------------------------

	public void OptionsButtonClicked(bool Switch)
	{
		ButtonSwitch(Switch ,startCanves);
		optionsCanves.SetActive(Switch);
	}

	public void ExitGame()
	{
		Application.Quit();
	}

	//#################################################################################################################################################################################################################
	//#                                                                                            ~~IN GAME~~                                                                                                        #
	//#################################################################################################################################################################################################################

	//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~OPTIONS~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	public void GameOptions(bool Switch)
	{
		ButtonSwitch(Switch ,options_Game);
	}		

	public void ExitToMenu() 
	{
		Save();
		options_Game.SetActive(false);
		Time.timeScale = 1;
		SceneManager.LoadScene(0);
	}

	//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~INVENTORY(OBJECT)~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	public void ItemSpawn(bool Switch)
	{
		ButtonSwitch(Switch ,inventory_Game);
		if (Switch)
		{
			player.moveable = true;
		}
		else
		{
			if (player.moveable)
			{
				player.moveable = false;
				float itemRate;
				for (int i = 0;i < 5;i++)  // 5 plekke full in side item inven
				{
					items[i] = null;
					itemPlace[i].sprite = null; 

					items[i] = ItemList.itemList[Random.Range(0, 8)];  // 1 to 8 == items in die list van ItemsList  
					itemRate = Random.Range(0.00001f, 0.99999f);

					if (itemRate > items[i].RareNr / 100)
					{
						items[i] = null;
					}
					else
					{
						itemPlace[i].sprite = itemImages[items[i].ImageNr];  //Plaas die SPRITES op die itemPanel
					}   
				}		
			}
		}
	}

	public void setInventory(int itemNr)
	{
		if (items[itemNr] != null)
		{
			switch ((int)items[itemNr].GenType)  //Sort die item wat gekies is in die gepasde groep in
			{
			case 0:
				{
					weaponsList.Add(items[itemNr]);
					//Debug.Log("1");
					break;
				}
			case 1:
				{
					armourList.Add(items[itemNr]);
					//Debug.Log("2");
					break;
				}
			case 2:
				{
					consumablesList.Add(items[itemNr]);
					//Debug.Log("3");
					break;
				}
			case 3:
				{
					ringsList.Add(items[itemNr]);
					//Debug.Log("4");
					break;
				}
			case 4:
				{
					upMatList.Add(items[itemNr]);
					//Debug.Log("5");
					break;
				}
			case 5:
				{
					keysList.Add(items[itemNr]);
					//Debug.Log("1");
					break;
				}
			case 6:
				{
					shieldList.Add(items[itemNr]);
					//Debug.Log("2");
					break;
				}
			case 7:
				{
					projecList.Add(items[itemNr]);
					//Debug.Log("3");
					break;
				}
			}                   
			items[itemNr] = null; 	//Stel item in ITEMPANEL na null
			itemPlace[itemNr].sprite = null;	//Remove dit selekteurde IMAGE uit IMAGEPANEL uit
		}
		Save();
	}

	//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~INVENTORY(PLAYER)~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	public void PlayerInvButton(int GenType)
	{
		switch (GenType)
		{
		case 0:
			{
				typeButton = (int)TypeButton.armourButton;
				inventoryList = armourList;
				break;
			}
		case 1:
			{
				typeButton = (int)TypeButton.weaponButton;
				inventoryList = weaponsList;
				break;
			}
		case 2:
			{
				typeButton = (int)TypeButton.shieldButton;
				inventoryList = shieldList;
				break;
			}
		case 3:
			{
				typeButton = (int)TypeButton.consButton;
				inventoryList = consumablesList;
				break;
			}
		case 4:
			{
				typeButton = (int)TypeButton.ringButton;
				inventoryList = ringsList;
				break;
			}
		case 5:
			{
				typeButton = (int)TypeButton.upMatButton;
				inventoryList = upMatList;
				break;
			}
		case 6:
			{
				typeButton = (int)TypeButton.keysButton;
				inventoryList = keysList;
				break;
			}
		case 7:
			{
				typeButton = (int)TypeButton.projectButton;
				inventoryList = projecList;
				break;
			}
		}
		PlayerInventory(false);
	}

	public void PlayerInventory(bool Switch)	
	{
		ButtonSwitch(Switch ,playerInventory_Game);
		if (Switch)
		{
			inventoryList = null;
			player.moveable = true;
			typeButton = (int)TypeButton.none; //So dat die conPanels nie wys as ek die 2de keer in die menu gaan nie, moet met ander 'buttons' dit ook doen
		}
		else
		{
			player.moveable = false;
			if (typeButton == (int)TypeButton.consButton)
			{
				consPanel.SetActive(true); //As die button geclick is om consum panel te wys
			}
			else
			{
				consPanel.SetActive(false);
			}
			GameObject[] temp = GameObject.FindGameObjectsWithTag("Button");
			for (int i = 0;i < temp.Length;i++)
			{
				Destroy(temp[i]);
			}
			try
			{
				int tel = -1;
				foreach (var item in inventoryList)
				{
					tel++;
					GameObject newButton = Instantiate (sampleButton) as GameObject;
					SampleButton invButton = newButton.GetComponent<SampleButton>();
					invButton.buttonNr = tel;
					invButton.buttonName.text = item.Name;
					invButton.buttonSubInfo.text = item.ItemInfo;
					invButton.buttonImage.sprite = itemImages[item.ImageNr];
					newButton.transform.SetParent(contentPanel);
				}
			}
			catch (NullReferenceException exceptionObject)
			{
				return;
			}
		}
	}

	//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~HOTBAR~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	public void setHotbar(int num)  
	{
		switch (typeButton) 
		{
		case 1: //weaponButton
			{
				weapon = weaponsList[num];
				Debug.Log(weapon.Name);
				break;
			}
		case 2: //armourButton
			{
				armour = armourList[num];
				Debug.Log(armour.Name);
				break;
			}
		case 3: //consButton
			{
				if (consumablesList[num] != null && consumSpace <= 10)		
				{
					consumSpace++;
					hotbar[consumSpace] = consumablesList[num];	//Vir stoor om te gebruik in runtime op INGAME HOTBAR
					hotbarPlace[consumSpace].sprite = itemImages[hotbar[consumSpace].ImageNr];

					consumablesList.RemoveAt(num);	
					PlayerInventory(false);
				}
				Debug.Log(hotbar[num].Name);
				break;
			}
		case 4: //ringButton
			{
				ring = ringsList[num];
				Debug.Log(ring.Name);
				break;
			}
		case 7: //shieldButton
			{
				shield = shieldList[num];
				Debug.Log(shield.Name);
				break;
			}
		case 8: //projectButton
			{
				projec = projecList[num];
				Debug.Log(projec.Name);
				break;
			}
		}
		sideItemNr = 0;	//NB
		Save();
	}

	public void removeHotbarItem(int num) 
	{
		if (hotbar[num] != null)
		{
			consumSpace--;
			consumablesList.Add(hotbar[num]);
			hotbar[num] = null;
			hotbarPlace[num].sprite = null;
			PlayerInventory(false);
			Save();
		}
	}

}





















