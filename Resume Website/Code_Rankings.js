"use strict";



class RankingItem
{
    name: string;
}

class IRatings
{
    let SetCodeRankingList(list)<RankingItem>: function();
}

class CodeRankingList implements IRatings
{

    constructor()
    {
        constructor(null);
    }

    constructor(rankingList)
    {
        this.codeRankingList = rankingList;
    }

    function GetCodeRankingList()<RankingItem>
    {
        return this.codeRankingList;
    }

    let function SetCodeRankingList(list)<RankingItem>
    {
        this.codeRankingList = list;
    }

    function AddItem(item)<RankingItem>
    {
        this.codeRankingList.push(item);
    }
}


var list = [ new RankingItem().name = "first",new RankingItem().name ="second"];
var CRL = new CodeRankingList(list);
console.log(CRL.GetCodeRankingList());









































//
