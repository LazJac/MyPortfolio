"use strict";


const CreateRankingLists = function(listMatrix)
{
    const MakePattern = function(rankingItem)
    {
        let pattern = "<p>" + rankingItem[0] + "</p><p>"
                            + rankingItem[1] + "</p>";
        return pattern;
    }

    if (listMatrix == null || listMatrix.length == 0)
    {
        return false;
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
    [1,1.5],
    [2,2.5],
    [3,3.5]
];

console.log(CreateRankingLists(list));









































//
