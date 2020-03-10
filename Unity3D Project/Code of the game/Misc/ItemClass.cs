using UnityEngine;

[System.Serializable]
public class ItemClass
{
	private float weigth, rareNr;
    private string nameItem, info, itemInfo;
    private int genType, setType, durability, stamCons, imageNr;
    private int phiDmg = 0, magDmg = 0, firDmg = 0, ligDmg = 0, darDmg = 0, posDmg = 0, tecDmg = 0;
    private int phiRes = 0, magRes = 0, firRes = 0, ligRes = 0, darRes = 0, posRes = 0, tecRes = 0;

	//ALL --> GenType, Name, SetType{Armour,Weapons,shields,bolt/magic}, PhiDmg, MagDmg, FirDmg, LigDmg, DarDmg, PosDmg, TecDmg, Durability, StamCons, Weigth, Info, ItemInfo, RareNr, imageNr, AnimSet*???!!, SkillzNeeded!!
    public ItemClass(int GenType, string Name, int SetType, int Durability, int StamCons, float Weigth, string Info, string ItemInfo, float RareNr, int ImageNr)
    {
        genType = GenType;
        nameItem = Name;
        setType = SetType;
        durability = Durability;
        stamCons = StamCons;
        weigth = Weigth;
        info = Info;
        itemInfo = ItemInfo;
        rareNr = RareNr;
		imageNr = ImageNr;
    }

    public int GenType
    {
        get
        {
            return genType;
        }
    }

    public string Name
    {
        get
        {
            return nameItem;
        }
    }

    public int SetType
    {
        get
        {
            return setType;
        }
    }

    public int Durability
    {
        get
        {
            return durability;
        }
    }

    public int StamCons
    {
        get
        {
            return stamCons;
        }
    }

    public float Weigth
    {
        get
        {
            return weigth;
        }
    }

    public string Info
    {
        get
        {
            return info;
        }
    }

    public string ItemInfo
    {
        get
        {
            return itemInfo;
        }
    }

    public float RareNr
    {
        get
        {
            return rareNr;
        }
    }

    public int ImageNr
    {
        get
        {
			return imageNr;
        }
    }

    public void setDmgAndRes(int PhiDmg, int PhiRes, int MagDmg, int MagRes, int FirDmg, int FirRes, int LigDmg, int LigRes, int DarDmg, int DarRes, int PosDmg, int PosRes, int TecDmg, int TecRes)
    {
        phiDmg = PhiDmg; phiRes = PhiRes;
        magDmg = MagDmg; magRes = MagRes;
        firDmg = FirDmg; firRes = FirRes;
        ligDmg = LigDmg; ligRes = LigRes;
        darDmg = DarDmg; darRes = DarRes;
        posDmg = PosDmg; posRes = PosRes;
        tecDmg = TecDmg; tecRes = TecRes;
    }

    public void getDmgAndRes(ref int PhiDmg, ref int PhiRes, ref int MagDmg, ref int MagRes, ref int FirDmg, ref int FirRes, ref int LigDmg, ref int LigRes, ref int DarDmg, ref int DarRes, ref int PosDmg, ref int PosRes, ref int TecDmg, ref int TecRes)
    {
        PhiDmg = phiDmg; PhiRes = phiRes;
        MagDmg = magDmg; MagRes = magRes;
        FirDmg = firDmg; FirRes = firRes;
        LigDmg = ligDmg; LigRes = ligRes;
        DarDmg = darDmg; DarRes = darRes;
        PosDmg = posDmg; PosRes = posRes;
        TecDmg = tecDmg; TecRes = tecRes;
    }
}
