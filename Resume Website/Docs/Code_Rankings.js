"use strict";


const listRankings =                //Hardcoding Code-Ranking Units; Easier to add more later
[
  //[CodeName        ,  Rating]
    ["C#"            , "Docs/Images/star5.png"],
    ["Java"          , "Docs/Images/star5.png"],
    ["Visual Basics" , "Docs/Images/star5.png"],
    ["Phython"       , "Docs/Images/star5.png"],
    ["PHP"           , "Docs/Images/star4.png"],
    ["MySQL"         , "Docs/Images/star5.png"],
    ["Javascript"    , "Docs/Images/star4.png"],
    ["MS-DOS"        , "Docs/Images/star2.png"],
    ["UNIX"          , "Docs/Images/star3.png"],
    ["Git"           , "Docs/Images/star4.png"],
    ["HTML/CSS"      , "Docs/Images/star5.png"],
    ["Django"        , "Docs/Images/star3.png"],
    ["Google Cloud"  , "Docs/Images/star4.png"],
    ["ASP.NET"       , "Docs/Images/star4.png"]
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
