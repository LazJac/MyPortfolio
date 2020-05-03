"use strict";


const listRankings =                //Hardcoding Code-Ranking Units; Easier to add more later
[
  //[CodeName        ,  Rating]
    ["C#"            , "Docs/Images/star5.webp"],
    ["Java"          , "Docs/Images/star5.webp"],
    ["Visual Basics" , "Docs/Images/star5.webp"],
    ["Phython"       , "Docs/Images/star5.webp"],
    ["PHP"           , "Docs/Images/star4.webp"],
    ["MySQL"         , "Docs/Images/star5.webp"],
    ["Javascript"    , "Docs/Images/star4.webp"],
    ["MS-DOS"        , "Docs/Images/star2.webp"],
    ["UNIX"          , "Docs/Images/star3.webp"],
    ["Git"           , "Docs/Images/star4.webp"],
    ["HTML/CSS"      , "Docs/Images/star5.webp"],
    ["Django"        , "Docs/Images/star3.webp"],
    ["Google Cloud"  , "Docs/Images/star4.webp"],
    ["ASP.NET"       , "Docs/Images/star4.webp"]
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
