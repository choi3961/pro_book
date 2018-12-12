var url = "../static/xml/fiction_tag.xml"; 
var lec = "";
fileRequest(url, lec, display01);

function fileRequest(url, lec_name, display){
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {

          if(this.responseXML){
          	console.log(this.responseXML);
            display(this, lec_name);   
          } 
          else alert("failed");
      }
    };
    xhttp.open("POST", url, true);
    xhttp.send();
}

function display01(xml){
    var i;
    var xmlDoc = xml.responseXML;
    var table="<tr><th>Index</th><th><span>Tag Name</span></th><th>edit</th></tr>";
    var x = xmlDoc.getElementsByTagName("tag");
    
    for (i = 0; i < x.length; i++) {
          var value = x[i].childNodes[0].nodeValue;
           table += "<tr id ='"+ value+"'><td>index</td>"+
                        "<td>" + value + "</td>" +
                        "<td id =" + value +">edit</td>"+

                    "</tr>" ;
    }
    document.getElementById("tag_list").innerHTML = table;
}

// when the user tries to edit
$(document).ready(function(){
