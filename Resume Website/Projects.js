"use strict";


const listProjects =                    //Hardcoding Project Units; Easier to add more later
[
  //[Code,  Rating]
    [4      ,"Images/stars.jpg"],
    [5      ,"Images/stars.jpg"],
    [6      ,"Images/stars.jpg"]
];

const MakePatternForProjects = function(rankItem) //Project Units's HTML pattern for each item
{
    let pattern = "<p>" + rankItem[0]
                        + "</p><img src='" + rankItem[1]
                        + "' alt='" + rankItem[0]
                        + "' style='height: 30px;'>";
    return pattern;
}

//CreateElementList found in AddHTML_Element.js
console.log(CreateElementList("anchor_projects", listProjects, MakePatternForProjects));
