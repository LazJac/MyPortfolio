"use strict";


const CreateRankingLists = function(elementList,elementAnchorID)
{
    if (elementList == null || elementList.length == 0)
    {
        return false;
    }

    for (let i = 0;i < elementList.length;++i)
    {
        var div = document.createElement('div');
        div.innerHTML = elementList[i];

        document.getElementById(elementAnchorID).appendChild(div);
    }

    return true;
}

let stringElements = [];
