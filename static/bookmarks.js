/*********************
This is for multiple bookmarks openning in once.
It reads the json data of Chrome bookmarks and makes the interface
of bookmarks dynamically iterating the bookmarks.

It uses jquery and jquery ui.

*******************/

// Global variable to contain JSON data from the server.
var data;
var count=0;
var level=-1;
var flag=false; // toggle signal

$("#allmarks").click(ajax);
$("#design").click(design);
$("#responsive").click(responsive);
$("#book_cover").click(book_cover);
$("#xquery").click(xquery);
$("#book_interior").click(book_interior);
$("#fop").click(fop);
$("#all_webs").click(all_webs);



// Receives the JSON data from the server.
// It creates almost all the elements and attributes according to the JSON data.
function ajax() {
    if(!flag){
        var xhr = new XMLHttpRequest();
        xhr.open('get', 'http://localhost:8984/static/bookmarks.json');
        xhr.send();

        // Track the state changes of the request.
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4) {
                if (xhr.status === 200) {
                    data = JSON.parse(xhr.responseText);
                    $("#display").append("<div id='bookmarks'/>");
                    traverse(data.roots.bookmark_bar);
                    assign();       // Assign event handlers
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

// Iterates json data
function traverse(node){
    if(node.type=="folder"){
        display(node);
        level++;
        for(var i=0;i<node.children.length;i++){
            count=i;   // The children's number.
            traverse(node.children[i]);
            if(i==node.children.length-1){
                level--;
            }
        }
    }
    else{}    
}

function display(node){
    var tag="";
    if(level==0){
        tag="mark1";
    }
    if(level==1){
        tag="mark2";
    } 
    if(level==2){
        tag="mark3";
    }       
    // Appends as many items of jquery-ui tabs as the number of videos in JSON data.
    $("#bookmarks").append("<div id='"+node.name+"'><button class='"+tag+"' value='"+count+"'>"+node.name+"</button><div>");
}

// Assign event handlers
function assign(){
                $(".mark1").click(mark); 
                $(".mark2").click(mark2);
                $(".mark3").click(mark3);
}

function mark(){
    console.log("mark");
    console.log(data);
    show(data.roots.bookmark_bar.children[this.value]);
}

function mark2(){
    console.log("mark2");
    console.log(data);
    //show(data.roots.bookmark_bar.children[this.value]);
}
function mark3(){
    console.log("mark3");
    //show(data.roots.bookmark_bar.children[this.value]);
}

function show(node){
    for(var i=0;i<node.children.length;i++){
        console.log("children");
        
        if(node.children[i].url)
        window.open(node.children[i].url);
    }
}

//remove bookmarks element
function rem(){
    $("#bookmarks").remove();
}

// window open : design folder
function design(){
    //window.open(data.roots.bookmark_bar.children[5].children[0].children[2].url);
    for(var k in data.roots.bookmark_bar.children[5].children[0].children){
        window.open(data.roots.bookmark_bar.children[5].children[0].children[k].url);
    }
}

//  window open : responsive web design folder
function responsive(){
    for(var k in data.roots.bookmark_bar.children[5].children[1].children){
        window.open(data.roots.bookmark_bar.children[5].children[1].children[k].url);
    }
}

//  window open : book cover folder
function book_cover(){
    //console.log("hello book_cover");
    for(var k in data.roots.bookmark_bar.children[1].children[2].children){
        window.open(data.roots.bookmark_bar.children[1].children[2].children[k].url);
    }
}

//  window open : xquery folder
function xquery(){
    //console.log("hello xquery");
    for(var k in data.roots.bookmark_bar.children[2].children[0].children){
        window.open(data.roots.bookmark_bar.children[2].children[0].children[k].url);
    }
}

//  window open : book interior folder
function book_interior(){
    //console.log("hello xquery");
    for(var k in data.roots.bookmark_bar.children[1].children[3].children){
        window.open(data.roots.bookmark_bar.children[1].children[3].children[k].url);
    }
}

//  window open : fop folder
function fop(){
    //console.log("hello xquery");
    for(var k in data.roots.bookmark_bar.children[1].children[4].children){
        window.open(data.roots.bookmark_bar.children[1].children[4].children[k].url);
    }
}

//  window open : all websites in front.
function all_webs(){
//console.log("hello all webs");
        var xhr = new XMLHttpRequest();
        xhr.open('get', 'http://localhost:8984/static/copy_allwebs.xml');
        xhr.send();

        // Track the state changes of the request.
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4) {
                if (xhr.status === 200) {
                    //console.log("received");
                    var xmlD = xhr.responseXML;
                    var x = xmlD.getElementsByTagName("link");
                    //console.log(x);

            for (i = 0; i <42; i++) { 
                var link = xmlD.getElementsByTagName("link")[i].childNodes[0].nodeValue;
                window.open(link);
                //console.log(link);
            }                    



                } else {
                     alert("Not working!!!");
                }
            }
        };  
}