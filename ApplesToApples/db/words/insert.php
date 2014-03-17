<?php 
  $file = file_get_contents('nouns.txt'); 
  $words = explode("\n", $file);
  $con = mysqli_connect("localhost","root","pass","ApplesToApples");
  if (mysqli_connect_errno($con)) {
    echo "Failed to connect to MySQL: " . mysqli_connect_error();
  }
  foreach($words as $value) {
    $str = "INSERT INTO words VALUES(\"" . $value . "\", \"noun\" , null);";
    echo $str;
    mysqli_query($con, $str);
  }
?>
