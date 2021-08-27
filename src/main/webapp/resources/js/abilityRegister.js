
  $(document).on("change", ".file-input", function(){
   
    $filename = $(this).val();

    if($filename == "")
      $filename = "파일을 선택해주세요.";

    $(".filename").text($filename);

  })


$(document).on("change", ".file-input2", function(){
   
    $filename2 = $(this).val();

    if($filename2 == "")
      $filename2 = "파일을 선택해주세요.";

    $(".filename2").text($filename2);

  })