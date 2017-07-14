// JavaScript Document
$(document).ready(function() {
	$("#clickUpload").bind("click",function(){
		$("#uploadfixed").show();
		beginUpload();
	});
});
function init(){
	$("#uploadfixed").empty();
	var initHTML = "<div class='uploadMainFrame'>"+
        	"<div class='frameShadow'></div>"+
            "<div class='up-head'>"+
                "<span class='title'>多图上传</span><span class='shut' id='shutUpload'><img src='images/close.png' /></span>"+
            "</div>"+
            "<div class='tabhead'><span class='local'>本地上传</span></div>"+
            "<div id='up-content' class='up-content'>"+
                "<div class='img-area'>"+
                    "<div id='chooseImg' class='pick-upload'>点击选择图片</div>"+
                    "<div class='img-upload'><label><input class='uploadImg' type='file' name='file' accept='image/*' multiple='multiple'/></label></div>"+
                "</div>"+
            "</div>"+
            "<div class='up-bottom'>"+
                "<div id='confirm' class='confirm'>确认</div>"+
                "<div id='clickCancel' class='cancel'>取消</div>"+
            "</div>"+
        "</div>";
	$("#uploadfixed").html(initHTML);
	beginUpload();
}
function beginUpload() {
		var uploadImg = $(".uploadImg").get(0);
		var uploadImgCount = 0;
		var uploadImgs = [];
		var imgNum = 0;
		/* 没上传不能确定 */
		$("#confirm").bind("click",function(){
			$("#imgSize").html("请上传图片!");
		});
		/* 取消上传 */
		$("#shutUpload,#clickCancel").bind("click",function(){
			$("#uploadfixed").hide();
			init();
		});
		uploadImg.onchange = function(){
			var imgList = this.files;
			var imgHTML = "<div class='statusBar'>"+
								"<div class='process' id='process'>"+
									"<span class='text' id='textValue'>0%</span>"+
									"<div class='percentage' id='uploadProcess'></div>"+
								"</div>"+
								"<div class='info' id='imgSize' style='display:inline-block; font-size:14px; color:#666666;'></div>"+
            					"<div class='btns'>"+
                					"<div class='addImg'>"+
                    					"<div class='addImg-pick'>继续添加</div>"+
                        				"<div class='addImg-upload'>"+
                    						"<label><input class='uploadImg' type='file' name='file' accept='image/*' multiple='multiple'/></label>"+
                        				"</div>"+
                    				"</div>"+
                   	 				"<div class='startUpload' id='startUpload'>开始上传</div>"+
                				"</div>"+
            			"</div>"+
						"<ul class='filelist' id='filelist'>"+
							"<li id='readyToAdd' class='continue'>"+
							"<div class='continueUpload'>"+
								"<label><input class='uploadImg' type='file' name='file' accept='image/*' multiple='multiple'/></label>"+
							"</div>"+
						"</li>";
			$("#up-content").empty();
			$("#up-content").html(imgHTML);
			/* 计算图片大小 */
			var uploadSize = 0;
			//var trueImgHTML = "";
			$.each(imgList,function(){
				uploadSize += this.size;
				uploadImgs.push(this);
				//var path = window.URL.createObjectURL(this);
				/* 路径  */
				var path ="";
				var file = this;
				if(file){
					var reader = new FileReader();
					reader.onload = function(e){
						path = e.target.result;
						/* 给图片增加下标 */
						dealUploadImgs(uploadImgs,imgNum);
						dealImagePreview(file,e);
						//imgHTML += uploadHTML;
						
					}
					reader.readAsDataURL(file);
				}	
			});
			/* 继续上传 */
			var continueUpload = $("#up-content").find(".uploadImg");
			console.log("uploadImg数量为:"+continueUpload.length);
			$.each(continueUpload,function(){
				$(this).bind("change",function(){
					var continueImgList = this.files;
					var uploadSize = 0;
					$.each(uploadImgs,function(){
						uploadSize += this.size;
					});
					$.each(continueImgList,function(){
						console.log("继续上传");
						uploadImgs.push(this);
						uploadSize += this.size;
						uploadImgs.push(this);
						var continueFile = this;
						var continuePath ="";
						if(continueFile){
							var continueReader = new FileReader();
							continueReader.onload = function(e){
								continuePath = e.target.result;
								console.log("当前图片路径为："+continuePath);
								/* 给图片增加下标 */
								dealUploadImgs(uploadImgs,imgNum);
								var nextHTML = "<li id='WU_IMG_"+continueFile.index+"'>"+
		                							"<p class='imgWrap'><img src='"+continuePath+"' /></p>"+
		                							"<p class='uploadSuccess'></p>"+
		                							"<p class='error'>上传失败</p>"+
		                							"<div class='cancelUpload'><span></span></div>"+
		                    					"</li>";
								$("#readyToAdd").before(nextHTML);
								/* clear the process bar */
								$("#process").css("display","none");
								$("#textValue").html("0%");
					        	$("#uploadProcess").css("width","0px");
					        	$("#imgSize").show();
								$("#imgSize").html("选中"+uploadImgs.length+"张图片，共"+uploadSize/1000+"K");
							}
							continueReader.readAsDataURL(continueFile);
						}
					});
					/* 删除动画 */
					deleteImg();
				});
			});
			/* 删除动画 */
			deleteImg();
			
			$("#startUpload").bind("click",function(){
				//$("#fileSubmit").click();
				$("#imgSize").hide();
				//for(var i=0;i<uploadImgs.length;i++){	}
				var iframeBody = $("#uploadEditor").contents().find("body");
				if(iframeBody.find("ul").length == 0){
					$("<ul></ul>").appendTo(iframeBody);
				}
				console.log("上传的图片数量为："+uploadImgs.length);
				$.each(uploadImgs,function(){
					var formData = new FormData();
					var file = this;
			        formData.append("filelist", this);
			        var index = this.index;
			        var html ="";
			        $.ajax({    
			        	type: 'POST',  
			  		  	url: "/Bangbang2.0/UpLoadServlet",
			  		  	data: formData,  
			  		  	async: true,  
			  		  	cache: false,  
			  		  	contentType: false,
			  		  	processData: false,  
			  		  	xhr: function(){
			  		  		myXhr = $.ajaxSettings.xhr();
			  		  		if(myXhr.upload){
			  		  			myXhr.upload.onprogress = function(e){
				  		  			console.log("进度条开始");
				  		        	var percent = (e.loaded / e.total * 100).toFixed(0);
				  		        	$("#process").css("display","block");
				  		        	$("#textValue").html(percent + "%");
				  		        	$("#uploadProcess").css("width",(percent / 100) * 198+"px");
			  		  			}
			  		  		}
			  		  		return myXhr;
			  		  	},
			  		  	success: function (data) {  
				  		  	var li_id = "WU_IMG_"+index;
				        	console.log("上传成功:"+li_id);
				        	uploadImgs.splice(index,1);
				        	$("#"+li_id).find(".uploadSuccess").show();
				        	$("#"+li_id).find(".imgWrap").unbind();
				        	$("#confirm").bind("click",function(){
				        		
				        		html += "<li><img src='user/"+data+"/upload/"+file.name+"' style='width:113px; height:113px;' /></li>";
				        		console.log("传入iframe："+html);
				        		$("#uploadEditor").contents().find("ul").append(html);
				        		$("#uploadfixed").hide();
				    			init();
				    		});
			  		  	},  
			  		  	error: function (returndata) {  
				  		  	var li_id = "WU_IMG_"+index;
				        	console.log("上传失败:"+li_id);
				        	$("'#WU_IMG_"+index+"'").find(".error").show(); 
			  		  	}  
			        });  	
				});
			});
		}
		function dealImagePreview(file,e){
			var uploadHTML = "<li id='WU_IMG_"+file.index+"'>"+
								"<p class='imgWrap'><img src='"+e.target.result+"' /></p>"+
								"<p class='uploadSuccess'></p>"+
								"<p class='error'>上传失败</p>"+
								"<div class='cancelUpload'><span></span></div>"+
								"</li>";
			$("#filelist").children("li:first-child").before(uploadHTML);
		}
		function dealUploadImgs(imgList,num){
			$.each(imgList, function(k, v){
				// 因为涉及到继续添加，所以下一次添加需要在总个数的基础上添加
				console.log("开始增加下标");
				v.index = num;
				// 添加一个之后自增
				num++;
			});
		}
		
		function deleteImg(){
			var timer;
			clearInterval(timer);
			var cancelList = $('.imgWrap');
			console.log("删除数量："+cancelList.length);
			//热门推荐动画
			$.each(cancelList,function(){
				var img = $(this);
				var deleteIcon = $(this).parent().find('.cancelUpload');
				img.bind("mouseover",function(){
					//console.log("ready to cancel");
					rollIn(deleteIcon);
				});
				img.bind("mouseout",function(){
					//console.log(" give up canceling");
					rollOut(deleteIcon);
				});
			});
			
			function rollIn(obj){
				clearInterval(obj.timer);
				obj.timer = setInterval(function(){
					var height = obj.height();
					if(height<30){
						height += 5;
						obj.css('height',height);
					}else{
						clearInterval(obj.timer);	
					}
				},50);
				obj.bind("mouseover",function(){
					clearInterval(obj.timer);
					var liElement = $(this).parent();
					var liId = liElement.attr("id");
					obj.bind("mouseover",function(){
						clearInterval(obj.timer);
						var btn = $(this).find("span");
						btn.bind("click",function(){
							var num = liId.replace(/[^0-9]/ig,"");
							uploadImgs.splice(num,1);
							$(this).parent().parent().remove();
							var totalSize = 0;
							$.each(uploadImgs,function(){
								totalSize += this.size;
							});
							
							$("#imgSize").html("选中"+uploadImgs.length+"张图片，共"+totalSize/1000+"K");
						});
					});
				});
			}
			function rollOut(obj){
				clearInterval(obj.timer);
				obj.timer = setInterval(function(){
					var height = obj.height();
					if(height>0){
						height -= 5;
						obj.css('height',height);
					}else{
						clearInterval(obj.timer);	
					}
				},50);
			}
		}
}
/*
var xhr = new XMLHttpRequest();
        var index = this.index;
        xhr.open("POST", "zz");
        xhr.upload.onprogress = function(e){
        	console.log("开始上传");
        	var percent = (e.loaded / e.total * 100).toFixed(0);
        	$("#process").css("display","block");
        	$("#textValue").html(percent + "%");
        	$("#uploadProcess").css("width",(percent / 100) * 198+"px");
        }
        xhr.onerror = function(index){
        	var li_id = "WU_IMG_"+index;
        	console.log("上传失败:"+li_id);
        	$("'#WU_IMG_"+index+"'").find(".error").show();
        }
        xhr.onload = function(){
        	var li_id = "WU_IMG_"+index;
        	console.log("上传成功:"+li_id);
        	uploadImgs.splice(index,1);
        	$("#"+li_id).find(".uploadSuccess").show();
        	$("#"+li_id).find(".imgWrap").unbind();
        	$("#confirm").bind("click",function(){
        		$.each(uploadImgs,function(){
        			var html = "<img src='images/"+this.name+"' style='width:113px; height:113px;' />";
        			console.log("传入iframe："+html);
        			$("#uploadEditor").contents().find("p").html(html);
        		});
        		$("#uploadfixed").hide();
    			init();
    		});
        }
        xhr.send(formData);
	});
}
*/