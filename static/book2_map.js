/*********************
This is for multiple bookmarks openning in once.
It reads the json data of Chrome bookmarks and makes the interface
of bookmarks dynamically iterating the bookmarks.

It uses jquery and jquery ui.

*******************/

// Global variable to contain JSON data from the server.
var data;
var count=0;
var item_count=0;       // for the item node
var item_count2=0;      // for the item node
var level=-1;
var flag=false;  // toggle signal

$("#map").click(ajax);
$("#design").click(design);
$("#responsive").click(responsive);

// Receives the JSON data from the server.
// It creates almost all the elements and attributes according to the JSON data.
function ajax() {
    if(!flag){
        var xhr = new XMLHttpRequest();
        xhr.open('get', 'http://localhost:8984/allwebs/book2_xml');
        xhr.send();

        // Track the state changes of the request.
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4) {
                if (xhr.status === 200) {
                    data = xhr.responseXML;
                    $("#display").append("<div id='process_map'/>");
                    traverse(data.children[0]);
                    //assign();       // Assign event handlers
                    console.log(data);
                } else {
                     alert("Not working!!!");
                }
            }
        }; 
        flag=true;
    }
    else{
        rem();      //remove bookmarks element
        flag=false;                
    }
}

// Iterates xml node
function traverse(node){
    if(node.children[0]){    
        display(node);
        level++;
        for(var i=0;i<node.children.length;i++){
            count=i;   // The children's number.

            traverse(node.children[i]);
            if(i==node.children.length-1){
                level--;
            }  
            if(node.nodeName=="item"){
                item_count2++;
                item_count=item_count2/3 + 1;
            }                           
        }
    }        
    else{//display(node);
    }        
}

function display(node){
    var tag="";
    if(level==0){
        tag="mark";
    }
    if(level==1){
        tag="mark2";
    } 
    if(level==2){
        tag="mark3";
    } 
    if(level==3){
        tag="mark4";
    }  
    if(level==4){
        tag="mark5";
    }          
    if(level==5){
        tag="mark6";
    }  
    if(level==6){
        tag="mark7";
    }             
    if(level==7){
        tag="mark8";
    } 
    if(level==8){
        tag="mark9";
    }  
    if(level==9){
        tag="mark10";
    }          
    if(level==10){
        tag="mark11";
    }   

    // Appends as many items of jquery-ui tabs as the number of videos in JSON data.
    if (node.nodeName=="item") {
        $("#process_map").append("<div id='"+node.nodeName+"'><button class='"+tag+"' value='"+count+"'>"+node.nodeName+item_count+"</button><div>");
    }
    else
        $("#process_map").append("<div id='"+node.nodeName+"'><button class='"+tag+"' value='"+count+"'>"+node.nodeName+"</button><div>");
}

//remove bookmarks element
function rem(){
    $("#process_map").remove();
}

