"use strict";


const RankingItem = function(name, surname) //<---Temp
{
    return [name,surname];
}

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

const CreateRankingLists = function()
{
    let listElements = CodeRankingList.GetCodeRankingList;
    if (listElements == null || listElements.length == 0)
    {
        return false;
    }

    for (let i = 0;i < listElements.length;++i)
    {
        let htmlString = MakePattern(listElements[i]);

        var div = document.createElement('div');
        div.innerHTML = htmlString;

        document.getElementById("anchor_profile").appendChild(div);
    }

    return true;
}

const MakePattern = function(rankingItem)
{
    let pattern = "<p>" + rankingItem[0] + "</p><p>"
                        + rankingItem[1] + "</p>";
    return pattern;
}

let list1 = RankingItem("1","1.5");
let list2 = RankingItem("2","2.5");
let list3 = RankingItem("3","3.5");

let list = [list1, list2, list3];
console.log(list);

CodeRankingList.SetCodeRankingList = list;
console.log(CreateRankingLists());









































//
