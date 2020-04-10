"use strict";


/*These 2 methods add a variety of HTML elements to the Document(using DOM).
  elementList = A list of HTML snippets, each with one or more elements*/
const CreateElementList = function(elementID, itemList, PatternFunction) //Call if elementList empty
{
    if(itemList == null || itemList.length == 0)
    {
        return false;
    }

    let stringElements = [];
    for (let i = 0;i < itemList.length;++i)
    {
        try
        {
            stringElements.push(PatternFunction(itemList[i]));
        }
        catch (error)
        {
            return false;
        }
    }

    return CreateRankingLists(elementID, stringElements);
}

const CreateRankingLists = function(elementID, elementList) //Call if elementList is known or made
{
    if (elementList == null || elementList.length == 0)
    {
        return false;
    }

    for (let i = 0;i < elementList.length;++i)
    {
        var div = document.createElement('div');
        div.innerHTML = elementList[i];

        document.getElementById(elementID).appendChild(div);
    }

    return true;
}
