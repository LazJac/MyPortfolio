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
