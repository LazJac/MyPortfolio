"use strict";


const CreateRankingLists = function(listMatrix)
{
    if (listMatrix == null || listMatrix.length == 0)
    {
        return false;
    }
    
    const MakePattern = function(rankItem)
    {
        let pattern = "<p id='" + rankItem[1] + "'>" + rankItem[0] + "</p>";
        return pattern;
    }


    for (let i = 0;i < listMatrix.length;++i)
    {
        let htmlString = MakePattern(listMatrix[i]);

        var div = document.createElement('div');
        div.innerHTML = htmlString;

        document.getElementById("anchor_profile").appendChild(div);
    }

    return true;
}


const list =
[
  //[Code,  Rating]
    [1      ,1.5],
    [2      ,2.5],
    [3      ,3.5]
];

console.log(CreateRankingLists(list));









































//
