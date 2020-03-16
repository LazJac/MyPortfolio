"use strict";


const listRankings =
[
  //[Code,  Rating]
    [1      ,1.5],
    [2      ,2.5],
    [3      ,3.5]
];

const MakePatternForRankings = function(rankItem)
{
    let pattern = "<p id='" + rankItem[1] + "'>" + rankItem[0] + "</p>";
    return pattern;
}

stringElements = [];
for (let i = 0;i < listRankings.length;++i)
{
    stringElements.push(MakePatternForRankings(listRankings[i]));
}


console.log(CreateRankingLists(stringElements,"anchor_profile"));









































//
