"use strict";


const listProjects =                    //Hardcoding Project Units; Easier to add more later
[
  //[Link                                           ,  Start img           , End img]
    ["https://github.com/LazJac"                    ,"Docs/Videos/start.gif"    ,"Docs/Videos/end.gif"]
];

const MakePatternForProjects = function(rankItem) //Project Units's HTML pattern for each item
{
/*ex  </br></br><a href="https://github.com/LazJac" target='_blank'>
                <img  onmouseenter='ProjectVideoController(true,"Videos/end.gif",this)'
                      onmouseleave='ProjectVideoController(false,"Videos/start.gif",this)'
                      src="Docs/Videos/start.gif"
                      alt='projectImage' style='width: 52vw;height: 13vw;object-fit: scale-down;'>
                </a></br>
*/
    let pattern = "</br></br><a href='" + rankItem[0] + "' target='_blank'>" +
                  "<img onmouseenter='ProjectVideoController(true, \"" + rankItem[2] + "\" ,this)'" +
                       "onmouseleave='ProjectVideoController(false, \"" + rankItem[1] + "\" ,this)'" +
                       "src='" + rankItem[1] + "'alt='projectImage'" +
                       " style='width: 52vw;height: 13vw;object-fit: scale-down;'></a></br></br>" +
                       "<hr style='margin-left: auto;margin-right: auto;'>";
    return pattern;
}

//CreateElementList found in AddHTML_Element.js
console.log(CreateElementList("anchor_projects", listProjects, MakePatternForProjects));
