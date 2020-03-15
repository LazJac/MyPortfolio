"use strict";


const CreateRankingLists = function(elementList)
{
    if (elementList == null || elementList.length == 0)
    {
        return false;
    }

    for (let i = 0;i < elementList.length;++i)
    {
        var div = document.createElement('div');
        div.innerHTML = elementList[i];

        document.getElementById("anchor_profile").appendChild(div);
    }

    return true;
}
