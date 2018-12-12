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
	$("#simple-page-master").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#simple-page-master");
	});
	$("#region-body").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#region-body");
	});
	$("#region-body02").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#region-body02");
	});
	$("#region-before").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#region-before");
	});
	$("#region-before02").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#region-before02");
	});
	$("#region-after").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#region-after");
	});
	$("#region-after02").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#region-after02");
	});
	$("#region-start").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#region-start");
	});
	$("#region-start02").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#region-start02");
	});
	$("#region-end").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#region-end");
	});
	$("#region-end02").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#region-end02");
	});
	$("#right-page-body").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#right-page-body");
	});
	$("#right-page-body02").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#right-page-body02");
	});
	$("#right-page-before").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#right-page-before");
	});
	$("#right-page-before02").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#right-page-before02");
	});
	$("#right-page-after").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#right-page-after");
	});
	$("#right-page-after02").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#right-page-after02");
	});
	$("#right-page-start").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#right-page-start");
	});
	$("#right-page-start02").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#right-page-start02");
	});
	$("#right-page-end").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#right-page-end");
	});
	$("#right-page-end02").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#right-page-end02");
	});
	$("#left-page-body").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#left-page-body");
	});
	$("#left-page-body02").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#left-page-body02");
	});
	$("#left-page-before").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#left-page-before");
	});
	$("#left-page-before02").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#left-page-before02");
	});
	$("#left-page-after").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#left-page-after");
	});
	$("#left-page-after02").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#left-page-after02");
	});
	$("#left-page-start").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#left-page-start");
	});
	$("#left-page-start02").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#left-page-start02");
	});
	$("#left-page-end").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#left-page-end");
	});
	$("#left-page-end02").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#left-page-end02");
	});
	$("#front").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#front");
	});
	$("#title").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#title");
	});
	$("#space02").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#space02");
	});
	$("#pic1").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#pic1");
	});
	$("#preface").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#preface");
	});
	$("#p").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#p");
	});
	$("#colophone").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#colophone");
	});
	$("#halfttl").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#halfttl");
	});
	$("#TOC").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#TOC");
	});
	$("#body").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#body");
	});
	$("#item").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#item");
	});
	$("#style").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#style");
	});
	$("#contents").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#contents");
	});
	$("#page").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#page");
	});
	$("#back").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#back");
	});
	$("#epilogue").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#epilogue");
	});
	$("#afterword").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#afterword");
	});
	$("#index").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#index");
	});
	$("#toc-ttl").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#toc-ttl");
	});
	$("#toc-itm").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#toc-itm");
	});
	$("#toc-pge").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#toc-pge");
	});
	$("#tit01").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#tit01");
	});
	$("#tit02").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#tit02");
	});
	$("#tit03").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#tit03");
	});
	$("#tit04").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#tit04");
	});
	$("#tit05").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#tit05");
	});
	$("#space01").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#space01");
	});
	$("#space03").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#space03");
	});
	$("#space04").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#space04");
	});
	$("#space05").click(function(){
		var temp = "<form><input type ='text' name ='first'/>";
		$(temp).insertAfter("#space05");
	});
});
