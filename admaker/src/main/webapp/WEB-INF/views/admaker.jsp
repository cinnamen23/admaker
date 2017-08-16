<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="shortcut icon" href="">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


</head>
<body>
<h1>광고 제작 페이지</h1>


<canvas id="c" width="800" height="500" style="border:1px solid #000000;"></canvas>

<div >
		<ul class='uploadedList'>

		</ul>
	</div>
	
 <form id="form1" runat="server">
   <input type='file' id="imgInp" />
   <img id="blah" src="#" alt="your image" width="400" height="200" />
</form>

<button id="confirm">confirm</button>

<button id="addtext">addText</button>
<input id="write" type="text">

<button id="save-jpeg">save-jpeg</button>

<div >
		<ul class='uploadedList2'>

		</ul>
	</div>
	<button id="delete">delete </button>
<button id="reset">reset </button>
<button id="deactive">deactive </button>

	<ul class="svg-shapes">
        <li><button class="btn btn-small shape" id="shape1"><strong>1</strong> paths</button></li>
        <li><button class="btn btn-small shape" id="shape2"><strong>2</strong> paths</button></li>
    </ul>
      
      
<script
        src="https://code.jquery.com/jquery-3.2.1.min.js"
        integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fabric.js/1.7.11/fabric.min.js"></script>




<script>


$(document).ready(function(){
	
	  var i= 0;
	  var bg="";
	  var canvas = this.__canvas = new fabric.Canvas('c');
      fabric.Object.prototype.transparentCorners = false;
	  
	  (function() {
        

        var rect1 = new fabric.Rect({
            width: 200, height: 100, left: 0, top: 50, angle: 30,
            fill: 'rgba(255,0,0,0.5)'
        });

        var rect2 = new fabric.Rect({
            width: 100, height: 100, left: 350, top: 250, angle: -10,
            fill: 'rgba(0,200,0,0.5)'
        });

        var rect3 = new fabric.Rect({
            width: 50, height: 100, left: 275, top: 350, angle: 45,
            stroke: '#eee', strokeWidth: 10,
            fill: 'rgba(0,0,200,0.5)'
        });

        var circle = new fabric.Circle({
            radius: 50, left: 275, top: 75, fill: '#aac'
        });

        var triangle = new fabric.Triangle({
            width: 100, height: 100, left: 50, top: 300, fill: '#cca'
        });

        



        canvas.add(rect1, rect2, rect3, circle, triangle);
        canvas.on({
            'object:moving': onChange,
            'object:scaling': onChange,
            'object:rotating': onChange,
        });

        function onChange(options) {
            options.target.setCoords();
            canvas.forEachObject(function(obj) {
                if (obj === options.target) return;
           //     obj.setOpacity(options.target.intersectsWithObject(obj) ? 0.5 : 1);
            });
        }
        
        

    })();
	  
	function addtext(puttext){
		var text = new fabric.Text(puttext, { left: 100, top: 100 });
        canvas.add(text);
      		
	}
	
	$("#shape1").click(function(e){
		
		
		var site_url = 'resources/mario.svg';

		fabric.loadSVGFromURL(site_url, function(objects) { 
			console.log(objects)"target/m2e-wtp/web-resources/META-INF/MANIFEST.MF"
		          var group = new fabric.PathGroup(objects, { 
		          left: 165, 
		          top: 100, 
		          width: 600, 
		          height: 600 
		          
		        }); 
			console.log(group)
		        canvas.add(group); 
		        canvas.renderAll(); 
		          }); 
        
        
	})
	$("#shape2").click(function(e){
		
		
		var si = 'resources/phone.svg';

		console.log(si)
		
		fabric.loadSVGFromURL(si, function(objects) {
			console.log(objects)
			
		          var group = new fabric.PathGroup(objects, { 
		          left: 165, 
		          top: 100, 
		          width: objects[0].cacheWidth, 
		          height: objects[0].cacheHeight
		          
		        }); 
			
			console.log(group)
			
		        canvas.add(group); 
		        canvas.renderAll(); 
		          }); 
        
        
	})
	
	
	
    
    function backg(bg){
		  
 		  var imgElement = document.getElementById(bg);
 		  console.log(imgElement);
		 
	        var imgInstance = new fabric.Image(imgElement, {
	            left: 100,
	            top: 100,
	            
	            opacity: 1
	        });
	        canvas.add(imgInstance);
	        canvas.bringToBack(imgInstance)
	        canvas.renderAll();

	  };
    
  
    
  
    $("#call").click(function(e){
    	
    	e.preventDefault();
    	
    	var formData = new FormData();    
    	
    	formData.append("file", $(".file")[i].files[0])       	
    	
    	$.ajax({
			url:'/admaker/getjpg',
			data: formData,
			dataType:'text',
			processData : false,
			contentType:false,
			type:'post',
			success:function(re){			
				selectfile();
				var str = "<div><img id='mybg' src='display?fileName="+re+"' width='200px'><button>삭제</button></div>"
				$(".uploadedList").append(str);
				
				console.log("re")

				console.log(re)
				
				console.log($("#mybg"))		
				
				backg("blah");				
				
				i++
				
			}
		});
    	
    	
    })
    
    $("#addtext").click(function(e){
    	e.preventDefault();
    	canvas.deactivateAll();
    	canvas.renderAll()
    
    	var puttext = $("#write").val();
    	addtext(puttext);
        canvas.renderAll();

    
    })
    
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#blah').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#imgInp").change(function(){
        readURL(this);
    });
    
    $("#confirm").click(function(){
    	
    	backg("blah");
    	
    })
    
    $("#save-jpeg").click(function () {
    	canvas.deactivateAllWithDispatch();
    	canvas.renderAll();
        var image = document.getElementById("c").toDataURL("image/jpeg");
        console.log("save")
        image = image.replace('data:image/jpeg;base64,', '');
        console.log(image)
        var formData = new FormData();    
    	
    	formData.append("image", image);
    	formData.append("sid", "sgsg1");
    	
        $.ajax({
        	
        	url:'/admaker/onepage',
        	data: formData,
			dataType:'text',
			processData : false,
			contentType:false,
			type:'post',
			success:function(re){
				console.log("re");
				console.log(re);
				
				var str = "<div><img id='mybg' src='data:image/jpeg;base64,"+re+"' width='500x'><button>삭제</button></div>"
				$(".uploadedList2").append(str);
				
				alert('Image saved successfully !');
				canvas.clear();
            }
        });
    });
    
    $("#reset").click(function(){  	
    	
    	canvas.clear();    	
    	
    })
    
    $("#delete").click(function(){  	
    	
    	canvas.remove(canvas.getActiveObject());
    	
    })
    
    $("#deactive").click(function(){  	
    	console.log("test1")
    	
    	canvas.deactivateAll();
    	canvas.renderAll()
    	
    })
    
    
    
    
    
    
     	
})   	
	

</script>




</body>
</html>