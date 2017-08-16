<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <script src="all.js"></script>
    <script src="Delicious_500.font.js"></script>
  </head>
  <body>
    <div id="wrapper">
    <div class="canvas-container">
    <canvas id="c" width="500" height="500" style="border:1px solid #ccc"></canvas>
    </div>
    </div>

    <div>
      <form name="myForm">
      <input type="button"
             value="Load Rect"
             name="button1"
             onClick="loadRect()">
     <input type="button"
             value="Load Green Circle"
             name="button2"
             onClick="loadCircle()">
      <input type="button"
             value="Load Image"
             name="button4"
             onClick="loadImage()">
      <input type="button"
             value="Load Text"
             name="button5"
             onClick="loadText()">
      <input type="button"
             value="Put Image"
             name="button3"
             onClick="putImage()">
    </form>    
    </div>
    <div>
    <img id="MyPix" border="1px">
    </div>
<script type="text/javascript">  
           
// counters
	
var loadCircleCounter=0;
var loadRectCounter=0; 
var loadImageCounter=0;

//Assign canvas to fabric
var canvas = new fabric.Canvas('c'); 

function loadText()
{
// Load text


      var textVar = "Hey guys";
      var textObj = new fabric.Text(textVar, { 
          fontFamily: 'Delicious_500', 
          left: 100,
          top: 100,
          fontSize: 24,
          textAlign: "left",
          fill:"#FF0000"  // Set text color to red
      });

      canvas.add(textObj);	
}

function loadRect()
{

// Load rect

var rect = new fabric.Rect({
  top: 100,
  left: 100,
  width: 60,
  height: 70,
  fill: 'red'
});	
loadRectCounter++;
canvas.add(rect);
canvas.renderAll();
}

function loadImage()
{

// Load image

// Load jpg image
  
  fabric.Image.fromURL('iphone.jpg', function(img) {
  var oImg = img.set({ left: 100, top: 100, angle: 0 }).scale(0.6);
  canvas.add(oImg).renderAll();  
});
loadImageCounter++;
canvas.renderAll();
}

function loadCircle()
{

// Load circle
  
canvas.add(new fabric.Circle({ radius: 30, fill: '#f55', top: 100, left: 100 }));
canvas.renderAll();
loadCircleCounter++;
}

function putImage()
{
	
  // put the png copy of canvas into the document	
	
  var canvas1 = document.getElementById("c");    
  if (canvas1.getContext) {
 	 var ctx = canvas1.getContext("2d");                // Get the context for the canvas.
     var myImage = canvas1.toDataURL("image/png");      // Get the data as an image.
  }
  var imageElement = document.getElementById("MyPix");  // Get the img object.
  imageElement.src = myImage;                           // Set the src to data from the canvas.
  
}
    </script>
  </body>
</html>