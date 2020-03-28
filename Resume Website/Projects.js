"use strict";


const listProjects =
[
  //[Code,  Rating]
    [4      ,"stars.jpg"],
    [5      ,"stars.jpg"],
    [6      ,"stars.jpg"]
];

const MakePatternForProjects = function(rankItem)
{
    let pattern = "<p>" + rankItem[0]
                        + "</p><img src='" + rankItem[1]
                        + "' alt='" + rankItem[0]
                        + "' style='height: 30px;'>";
    return pattern;
}

stringElements = [];
for (let i = 0;i < listProjects.length;++i)
{
    stringElements.push(MakePatternForProjects(listProjects[i]));
}


console.log(CreateRankingLists(stringElements,"anchor_projects"));
