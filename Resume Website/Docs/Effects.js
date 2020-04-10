"use strict";


const FlashRed = function()
{
    const ogColor = document.getElementById("sidebar").style.background;
    let tel = 0;
    let timer = 0;
    const timeInterval = 150;

    while (tel != 2)
    {
        timer += timeInterval;
        setTimeout(function(){ document.getElementById("sidebar").style.background = "#f64089"; } , timer);
        timer += timeInterval;
        setTimeout(function(){ document.getElementById("sidebar").style.background = ogColor; } , timer);

        ++tel;
    }

    console.log("true");
}

const ProjectVideoController = function(isHovering, image, gifElement)
{
    if (image == null)
    {
        console.log(false);
        return;
    }

    if (ZoomInEffect(isHovering, gifElement))
    {
        gifElement.src = image;
    }
    else
    {
        console.log(false);
        return;
    }
}

const ZoomInEffect = function(isHovering, element)
{
    if (element == null)
    {
        console.log(false);
        return false;
    }

    if (isHovering)
    {
        element.style.transform = "scale(1.1)";
    }
    else
    {
        element.style.transform = "scale(1)";
    }

    return true;
}
