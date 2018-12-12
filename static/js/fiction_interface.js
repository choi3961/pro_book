var url = "../static/xml/fiction_tag.xml"; 
var lec = "";
fileRequest(url, lec, display01);

function fileRequest(url, lec_name, display){
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {

          if(this.responseXML){
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

    var lists ="";

    var x = xmlDoc.getElementsByTagName("tag");
    
    for (i = 0; i < x.length; i++) {

        if(i > 9){
            var j = i;
        }

        else j = "0" + i ;

        var value = x[i].childNodes[0].nodeValue;
        lists += "<div id ='"+ value +"'>";
        lists += "<br/><ul><li>" + j + "</li> <li><a>" + value +"</a></li>";
        lists += "<li class='button01 edit'>edit</li>";
        lists += "<li class='button01 span01'>input</li>";   
        lists += "<li class='button01 span04'>to_default</li>"; 
        lists += "<li class='button01 span03'>call</li>";           
        lists += "<li class='button01 span05'>fr_dfault</li>";
        lists += "<li class='button01 span06'>font</li>";        
        lists += "</ul>";
        lists += "<br/><br/><form></form>";
        lists += "</div>";
    }
    document.getElementById("tag_list").innerHTML = lists;
}





// This is for font select from the user interface
$(document).on("change","#font_option",function(){

      var context = $(this).parent().parent().attr('id');

      //var temp =  $("option:selected", this);

      var temp =  this.value;

      //var temp = "hello";

      //console.log(temp);

      if (!temp) {
          console.log("no");
          //alert("입력 오류입니다.");
        
      }


      else if(temp){
        console.log(temp);
          // Save the context of <sttributes>s to the "default.xml"
         
          $.post("/book_fiction/font_option/"+context,
          {
            first: temp
          },
          function(data,status){
            

            console.log(data);

            alert("서체가 변경되었습니다.");
          });     
                 
      }

      else{
          //alert("데이터가 입력되지 않았습니다...");
      }

});























///////////////// this is for uuid auth

$(document).on("click", ".span007", function(){

auth_mod();

});


function auth_mod(){
    // Save the context of <sttributes>s to the "default.xml"
    $.post("/book_fiction/auth",
    {
      first: "long time",
      second: "tttttt"
    },
    function(data,status){
      //console.log(data);
      //alert("확인되었습니다.");
    });              

}






//////////////////////











// for fonts list, receive the fonts list from the server and show the data in fonts list form in html.
$(document).on("click", ".span06", function(){

    var url = "font_show"; 

    var font_list;
    var string;

    $.ajaxSetup({async:false});       //Requests are asynchronous (non-blocking) by default

    $.get(url, 
      function(data,status){

        font_list = font_setup(data);

    }, "text"); 

    //console.log(font_list);

    $(this).parent().append(font_list);

    $.ajaxSetup({async:true});        //Requests are asynchronous (non-blocking) by default

});

// Set up the fonts list with the data from the server to show <select><option/><select/> in html
function font_setup(data) {

    // to string without <tags>

    var div = document.createElement("div");

    div.innerHTML = data;

    var text = div.innerText;


    // delimiter : contain the data in array by delimiter.

    var delimeter = '..';

    var string = text;

    var splitted = string.split(delimeter);

    var format = "";


    // make select form, for example <select><option>...<option/><option>...<option/><select/>

    for (var i = 0; i < splitted.length; i++) {
      format += "<option>" + splitted[i]+ "</option>";
    }

    format = "<select id='font_option'>" + format + "</select>" + "<span class = 'span003'> x</span>";

    return format;
}


// when the user tries to edit
$(document).on("click",".edit",function(){
      var context = $(this).parent().parent().attr('id');
      var temp = "<input type = 'text' name = 'first'>";
      temp +="<input type = 'text' name = 'second'><span class ='span02'> x</span> <br/>";
      $("#" + context + " form").append(temp) ;
});

// when the user tries to edit
$(document).on("click",".span01",function(){

      var context = $(this).parent().parent().attr('id');

      var temp =  $("#"+context+" form").serialize();

      if (temp.includes("first=&second=")||temp.includes("second=&")||temp.substr(-7)=="second=") {
        //console.log(temp);
        alert("입력 오류입니다.");
        //console.log(temp.substr(-7));
      }

      else if(temp){
          // Save the context of <sttributes>s to the "default.xml"
          $.post("/book_fiction/edit/"+context,
          {
            first: temp,
            second: "tttttt"
          },
          function(data,status){
            console.log(temp);
            alert("데이터가 속성파일에 입력되었습니다....");
          });              
      }

      else{
          alert("데이터가 입력되지 않았습니다...");
      }

});

// from display to "default.xml". The process is partly similar to the "span01" event handler.
$(document).on("click",".span04",function(){

    // Read the context of <attribute>s from the display
    var context = $(this).parent().parent().attr('id');

    var temp =  $("#"+context+" form").serialize();

    if (temp.includes("first=&second=")||temp.includes("second=&")||temp.substr(-7)=="second=") {
      //console.log(temp);
      alert("입력 오류입니다.");
      console.log(temp.substr(-7));
    }
    else if(temp){
        // Save the context of <sttributes>s to the "default.xml"
        $.post("/book_fiction/to_default/"+context,
        {
          first: temp,
          second: "tttttt"
        },
        function(data,status){
          console.log(temp);
          alert("데이터가 디폴트 파일에 입력되었습니다....");
        });              
    }
    else{
        alert("데이터가 입력되지 않았습니다...");
    }
});

// from "default.xml" to display
$(document).on("click", ".span05", function(){

    var html_str = "";
    var context = $(this).parent().parent().attr('id');
    var url = "../static/default_set/default.xml"; 


 
    $.post(url, 
      function(data,status){
        var i;
        var xmlDoc = data;
        var x = data.getElementsByTagName("default");
        var list = "";

        for (i = 0; i < x.length; i++) {
              var value = x[i].children[0].childNodes[0].nodeValue;

              //console.log("node???");
              //console.log(value);
              if (value == context) {

                console.log(value);

                var attr = x[i].getElementsByTagName("attribute");

                console.log(attr);

                ///////////////////////////////////

                html_str = render_default(attr);
              }
              else{
              }            
        }
        $("#" + context + " form").append(html_str);
    });  
});

$(document).on("click",".span03",
    function(){
        var html_str = "";
        var context = $(this).parent().parent().attr('id');
        var url = "../static/xsl/fiction_attribute.xsl";   
     
        $.post(url, 
          function(data,status){
            var i;
            var xmlDoc = data;
            var x = data.getElementsByTagName("xsl:attribute-set");
            var list = "";

            for (i = 0; i < x.length; i++) {
                  var value = x[i].getAttribute('name');
                  
                  if (value == context) {
              
                    var attr = x[i].getElementsByTagName("xsl:attribute");

                    html_str = show_attr(attr);
                  }
                  else{
                  }            
            }
            $("#" + context + " form").append(html_str);
    });  
});

$(document).on("click",".span02",function(){
    $(this).prev().prev().remove();
    $(this).prev().remove();
    $(this).next("br").remove();
    $(this).remove();  
});

$(document).on("click",".span003",function(){
    $(this).prev().remove();
    $(this).next("br").remove();
    $(this).remove();  
});

function random(){
    return Math.floor((Math.random() * 10) + 1);
}  

function render_default(arr){
  var temp = "";

  str = arr.length;

    for (i = 0; i < arr.length; i++) {
        var name = arr[i].children[0].childNodes[0].nodeValue;
        var value = arr[i].children[1].childNodes[0].nodeValue;
        temp += "<input type = 'text' name = 'first' value ='"+ name +"'>";
        temp += "<input type = 'text' name = 'second' value ='"+value+"'><span class ='span02'> x</span> <br/>";
    }
  return temp;
}

function show_attr(arr){
  var temp = "";

  str = arr.length;

    for (i = 0; i < arr.length; i++) {
        var value = arr[i].childNodes[0].nodeValue;
        var name = arr[i].getAttribute('name');
        temp += "<input type = 'text' name = 'first' value ='"+ name +"'>";
        temp += "<input type = 'text' name = 'second' value ='"+value+"'><span class ='span02'> x</span> <br/>";
    }
  return temp;
}


$(document).on("click", "#example",function(){
    //alert('example');
    var url = "../static/xml/example.xml";  

    $.post(url,

    function(data, status){
        show_example(data, status);
    });
});  

function show_example(data, status){
        
        var xmlDoc = data;
        var x = data.getElementsByTagName("example");
        var sample = "";
        for (i = 0; i < x.length; i++) {
              var value = x[i].childNodes[0].nodeValue;
              console.log(value);
              sample += "<input type='text' value='" +value+ "'></input><br/>";
              
        
        }    
        var myWindow = window.open("", "", "width=500,height=500");
        myWindow.document.write(sample);
} 


/*******
$(document).on("click", "#font_show",function(){
    //alert('font_show');
    
            var dlgHelper = document.getElementById ("dlgHelper");

            if (dlgHelper.fonts) {      // Internet Exlporer
                var fontList = "";
                for (var i = 1; i < dlgHelper.fonts.Count; i++) {
                    if (i > 1) {
                        fontList += ", ";
                    }
                    fontList += dlgHelper.fonts (i);
                }
                
                alert ("The number of fonts is " + dlgHelper.fonts.Count);
                alert ("The available system fonts:\n" + fontList);
            }
            else {
                alert ("Your browser doesn't support this example!");
            }
********/            
/***************
//alert('font_show');
//alert("Flash is required to enjoy this site.");
  if(!FlashDetect.installed){
    alert("Flash is required to enjoy this site.");       
  }else{
    alert("Flash is insalled on your Web browser.");
  }
console.log(FlashDetect.installed);

});  ****************/