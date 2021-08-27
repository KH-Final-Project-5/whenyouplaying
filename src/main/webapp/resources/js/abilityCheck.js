function refuseForm(){
    document.getElementById("refuse").style.display = "block";
    document.body.style.background = "gray";
    
    var btns = document.getElementsByName("btn");
    for(var i in btns){
        btns[i].disabled = "disabled";
    }
}

function closeWin(){
    document.getElementById("refuse").style.display = "none";
    document.body.style.background = "white";
    
    var btns = document.getElementsByName("btn");
    for(var i=0; i<btns.length; i++){
        btns[i].disabled = "";
    }
}