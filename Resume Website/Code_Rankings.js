"use strict";


const listRankings =                //Hardcoding Code-Ranking Units; Easier to add more later
[
  //[CodeName        ,  Rating]
    ["C#"            , "Images/stars.jpg"],
    ["Java"          , "Images/stars.jpg"],
    ["Visual Basics" , "Images/stars.jpg"],
    ["Phython"       , "Images/stars.jpg"],
    ["PHP"           , "Images/stars.jpg"],
    ["MySQL"         , "Images/stars.jpg"],
    ["Javascript"    , "Images/stars.jpg"],
    ["MS-DOS"        , "Images/stars.jpg"],
    ["UNIX"          , "Images/stars.jpg"],
    ["Git"           , "Images/stars.jpg"],
    ["HTML/CSS"      , "Images/stars.jpg"],
    ["Django"        , "Images/stars.jpg"],
    ["Google Cloud"  , "Images/stars.jpg"],
    ["ASP.NET"       , "Images/stars.jpg"]
];


const MakePatternForRankings = function(rankItem) //Code-Ranking Units's HTML pattern for each item
{
    /*ex. <p>C#</p>
          <img scr="Images/star5.jpg" alt="C#" style='height: 30px;'> */
    let pattern = "<p>" + rankItem[0]
                        + "</p><img src='" + rankItem[1]
                        + "' alt='" + rankItem[0]
                        + "' style='height: 30px;'>";
    return pattern;
}

//CreateElementList found in AddHTML_Element.js
console.log(CreateElementList("sidebar", listRankings, MakePatternForRankings));
