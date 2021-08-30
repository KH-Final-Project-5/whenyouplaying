$(document).on("change", ".file-input", function () {

    $filename = $(this).val();

    if ($filename == "")
        $filename = "파일을 선택해주세요.";

    $(".filename").text($filename);

})


function setThumbnail1(event) {
    var reader = new FileReader();
    reader.onload = function (event) {
        var img = document.createElement("img");
        img.setAttribute("class", "imgTwo");
        img.setAttribute("src", event.target.result);
        document.querySelector("td.fileBox1").appendChild(img);
    };
    reader.readAsDataURL(event.target.files[0]);
}