"use strict";


const listRankings =
[
  //[Code,  Rating]
    [1      ,"stars.jpg"],
    [2      ,"stars.jpg"],
    [3      ,"stars.jpg"]
];

const MakePatternForRankings = function(rankItem)
{
    let pattern = "<p>" + rankItem[0] 
                        + "</p><img src='" + rankItem[1]
                        + "' alt='" + rankItem[0]
                        + "' style='height: 30px;'>";
    return pattern;
}

stringElements = [];
for (let i = 0;i < listRankings.length;++i)
{
    stringElements.push(MakePatternForRankings(listRankings[i]));
}


console.log(CreateRankingLists(stringElements,"anchor_profile"));









































//
