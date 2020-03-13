"use strict";


const RankingItem =
{
    name
};

//const IRatings =
//{
//    SetCodeRankingList: function(list)
//    {
//        this.items = list;
//    }
//};

const CodeRankingList =
{
    AddItem: function(item)
    {
        this.codeRankingList.push(item);
    },

    get GetCodeRankingList()
    {
        return this.codeRankingList;
    },

    set SetCodeRankingList(list)
    {
        this.codeRankingList = list;
    }
};


var list = [ RankingItem.name = "first", RankingItem.name = "second"];
var CRL = CodeRankingList;
CRL.SetCodeRankingList = list;
CRL.AddItem(RankingItem.name = "third");
console.log(CRL.GetCodeRankingList);









































//
