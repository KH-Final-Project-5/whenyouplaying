$(document).on("change", ".file-input", function () {

    $filename = $(this).val();

    if ($filename == "")
        $filename = "파일을 선택해주세요.";

    $(".filename").text($filename);

})


$(document).on("change", ".file-input2", function () {

    $filename2 = $(this).val();

    if ($filename2 == "")
        $filename2 = "파일을 선택해주세요.";

    $(".filename2").text($filename2);

})


function setThumbnail1(event) {
    var reader = new FileReader();
    reader.onload = function (event) {
        var img = document.createElement("img");
        img.setAttribute("class", "imgTwo");
        img.setAttribute("src", event.target.result);
        document.querySelector("div#fileBox1").appendChild(img);
    };
    reader.readAsDataURL(event.target.files[0]);
}

function setThumbnail2(event) {
    var reader = new FileReader();
    reader.onload = function (event) {
        var img = document.createElement("img");
        img.setAttribute("class", "imgTwo");
        img.setAttribute("src", event.target.result);
        document.querySelector("div#fileBox2").appendChild(img);
    };
    reader.readAsDataURL(event.target.files[0]);
}