// JavaScript Document
$(document).ready(function() {
	$("#updateHeadImg").bind("change",function(){
		console.log("zz");
		var file = this.files[0];
		if(file){
			var reader = new FileReader();
			reader.onload = function(e){
				path = e.target.result;
				$("#userHeadImg").attr("src",path);
			}
			reader.readAsDataURL(file);
		}
		
	});
	$("#male").bind("click",function(){
		console.log($(this).prop("checked"));
		$("#female").prop("checked",false);
	});
	$("#female").bind("click",function(){
		console.log($(this).prop("checked"));
		$("#male").prop("checked",false);
	});
});