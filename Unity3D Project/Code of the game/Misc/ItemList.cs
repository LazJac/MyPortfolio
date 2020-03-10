using UnityEngine;
using UnityEngine.UI;
using System.Collections.Generic;

public class ItemList : MonoBehaviour
{
    public static List<ItemClass> itemList = new List<ItemClass>();


	private int imageNr;
    private int phiDmg = 0, magDmg = 0, firDmg = 0, ligDmg = 0, darDmg = 0, posDmg = 0, tecDmg = 0;
    private int phiRes = 0, magRes = 0, firRes = 0, ligRes = 0, darRes = 0, posRes = 0, tecRes = 0;
    private enum Type { weapon, armour, consumable, rings, upgrMat, key, shield, projec };

	private void Start()
    {
		//#0 Weapons --> GenType, Name, SetType{Weapons}, ELEMENTS, Durability, StamCons, Weigth, Info, RareNr, imageNr {0}
        ItemClass w001 = new ItemClass((int)Type.weapon, "Wap1", 1, 10, 50, 20, "LORE A THANG", null, 3, 0);
        w001.setDmgAndRes(10, 0, 0, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
        itemList.Add(w001);
		//#1 Armour --> GenType, Name, SetType{Armour}, ELEMENTS, Durability, StamCons, Weigth, Info, RareNr, imageNr {1}
        ItemClass a001 = new ItemClass((int)Type.armour, "Arm_SET_1", 3, 20, 0, 20, "CLOTHANG", null, 60, 1);
        a001.setDmgAndRes(0, 0, 0, 0, 0, 0, 0, 0, 0, 90, 0, 0, 60, 0);
        itemList.Add(a001);
		//#2 Consumables --> GenType, Name, ELEMENTS, Weigth, Info, ItemInfo, RareNr, imageNr {2}
        ItemClass c001 = new ItemClass((int)Type.consumable, "Con1", 0, 0, 0, 0.5f, "THIS IS A CON!!", "CON BACKSTORY", 100, 2);
        c001.setDmgAndRes(5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 0, 5);
        itemList.Add(c001);
		//#3 Rings --> GenType, Name, ELEMENTS, Weigth, Info, ItemInfo, RareNr, imageNr {3}
        ItemClass r001 = new ItemClass((int)Type.rings, "Rin1", 0, 0, 0, 1.5f, "ZHA RING MOUNT MORDER AND STUFF", "ITS A RING !! RUUN!!", 0.05f, 3);
        r001.setDmgAndRes(0, 0, 0, 95, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
        itemList.Add(r001);
		//#4 UpMat --> GenType, Name, Info, RareNr, imageNr {4}
        ItemClass u001 = new ItemClass((int)Type.upgrMat, "UpG1", 0, 0, 0, 0, "BETTER FASTER STRONGER", null, 30, 4);
        itemList.Add(u001);
		//#5 Keys --> GenType, Name, Info, RareNr, imageNr {5}
        ItemClass k001 = new ItemClass((int)Type.key, "Key1", 0, 0, 0, 0, "OPENS STUFF, DUH", null, 0.5f, 5);
        itemList.Add(k001);
		//#6 Shields --> GenType, Name, SetType{Shield}, ELEMENTS, Durability, StamCons, Weigth, Info, RareNr, imageNr {6}
        ItemClass s001 = new ItemClass((int)Type.shield, "Shi1", 2, 40, 20, 10, "BLOCK THE FEELS, YO!", null, 40, 6);
        s001.setDmgAndRes(10, 0, 0, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
        itemList.Add(s001);
		//#7 Projec --> GenType, Name, SetType{Bolt/Magic}, ELEMENTS, StamCons, Info, RareNr, imageNr {7}  (GenType = Arrow/Spell)(SetType = Vir 'Arrow'{Arrow/Bolt} / Vir 'Spell'{Magic/Cleric})
        ItemClass p001 = new ItemClass((int)Type.projec, "Pro1", 2, 0, 80, 6, "BANG!!", null, 30, 7);
        p001.setDmgAndRes(0, 0, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
        itemList.Add(p001);
		//#8 Consumable --> GenType, Name, ELEMENTS, Weigth, Info, ItemInfo, RareNr, imageNr {2}
		ItemClass c002 = new ItemClass((int)Type.consumable, "Con2", 0, 0, 0, 0.5f, "ANOTHER CON!!", "CON BACKSTORY AGAIN", 100, 0);
		c002.setDmgAndRes(5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 0, 5);
		itemList.Add(c002);


        //Debug.Log(itemList[0].Weigth);

        //itemList[0].getDmgAndRes(ref phiDmg,ref phiRes,ref magDmg,ref magRes,ref firDmg,ref firRes,ref ligDmg,ref ligRes,ref darDmg,ref darRes,ref posDmg,ref posRes,ref tecDmg,ref tecRes);
        // Debug.Log(tecDmg);


        //int dir = (int)Type.misc;
    }
}
