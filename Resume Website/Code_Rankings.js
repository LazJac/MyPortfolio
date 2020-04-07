"use strict";


const listRankings =                //Hardcoding Code-Ranking Units; Easier to add more later
[
  //[CodeName        ,  Rating]
    ["C#"            , "Images/star5.png"],
    ["Java"          , "Images/star5.png"],
    ["Visual Basics" , "Images/star5.png"],
    ["Phython"       , "Images/star5.png"],
    ["PHP"           , "Images/star4.png"],
    ["MySQL"         , "Images/star5.png"],
    ["Javascript"    , "Images/star4.png"],
    ["MS-DOS"        , "Images/star2.png"],
    ["UNIX"          , "Images/star3.png"],
    ["Git"           , "Images/star4.png"],
    ["HTML/CSS"      , "Images/star5.png"],
    ["Django"        , "Images/star3.png"],
    ["Google Cloud"  , "Images/star4.png"],
    ["ASP.NET"       , "Images/star4.png"]
];


const MakePatternForRankings = function(rankItem) //Code-Ranking Units's HTML pattern for each item
{
    /*ex. <p>C#</p>
          <img scr="Images/star5.jpg" alt="C#" style='height: 30px;'> */
    let pattern = "<p>" + rankItem[0]
                        + "</p><img src='" + rankItem[1]
                        + "' alt='" + rankItem[0]
                        + "' style='height: 26px;'"
                        + " >";
    return pattern;
}

//CreateElementList found in AddHTML_Element.js
console.log(CreateElementList("sidebar", listRankings, MakePatternForRankings));
