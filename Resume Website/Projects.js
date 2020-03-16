"use strict";


const listProjects =
[
  //[Code,  Rating]
    [4      ,4.5],
    [5      ,5.5],
    [6      ,6.5]
];

const MakePatternForProjects = function(rankItem)
{
    let pattern = "<p id='" + rankItem[1] + "'>" + rankItem[0] + "</p>";
    return pattern;
}

stringElements = [];
for (let i = 0;i < listProjects.length;++i)
{
    stringElements.push(MakePatternForProjects(listProjects[i]));
}


console.log(CreateRankingLists(stringElements,"anchor_projects"));
