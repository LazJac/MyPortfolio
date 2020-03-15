"use strict";


const list =
[
  //[Code,  Rating]
    [1      ,1.5],
    [2      ,2.5],
    [3      ,3.5]
];

const MakePattern = function(rankItem)
{
    let pattern = "<p id='" + rankItem[1] + "'>" + rankItem[0] + "</p>";
    return pattern;
}

let stringElements = [];
for (let i = 0;i < list.length;++i)
{
    stringElements.push(MakePattern(list[i]));
}


console.log(CreateRankingLists(stringElements));









































//
