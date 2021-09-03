$(function(){

    $("#report1").click(function(){
        $("#textbox").val("");
        $("#textbox").attr("disabled", true);
        $("#textbox").attr("background", 'gray');

    });

    $("#report2").click(function(){
        $("#textbox").val("");
        $("#textbox").attr("disabled", true);
        $("#textbox").attr("background", 'gray');
    });
    
    $("#report3").click(function(){
        $("#textbox").val("");
        $("#textbox").attr("disabled", true);
        $("#textbox").attr("background", 'gray');
    });
    
    $("#report4").click(function(){
        $("#textbox").attr("disabled", false);
    });

});