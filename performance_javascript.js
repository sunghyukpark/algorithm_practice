<script type="text/javascript" src="file2.js"></script>
<script type="text/javascript" src="file3.js"></script>
<link rel="stylesheet" type="text/css" href="styles.css">

//Dynamic Script Elements
var script = document.createElement("script")
script.type = "text/javascript"
script.src = "files1.js"
document.getElementByTagName("head")[0].appendChild(script);

//
var script= document.createElement("script")
script.type = "text/javascript"

script.onload= function(){
  alert("Script loaded!")
}

//XMLHttpRequest Script Injection
var xhr = new XMLHttpRequest();
xhr.open("get", "file1.js", true);
xhr.onreadystatechange = function(){
  if(xhr.readyState == 4){
    if(xhr.status >= 200 && xhr.status < 300 || xhr.status ==304){
      var script = document.createElement("script");
      script.type = "text/javascript";
      script.text = xhr.responseText;
      document.body.appendChild(script);
    }
  }
};
xhr.send(null);

// Scope
function add(num1, num2){
  var sum = num1+ num2;
  return sum;
}