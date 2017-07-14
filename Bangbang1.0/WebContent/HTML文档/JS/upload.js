// JavaScript Document
$(document).ready(function() {
		var uploadImg = $(".uploadImg").get(0);
		
		var uploadImgs = [];
		var uploadSize = 0;
		var uploadImgCount = 0;
		$("#confirm").bind("click",function(){
						
		});
		uploadImg.onchange = function(){
			console.log("zz");
			var imgList = this.files;
			var imgHTML = "<div class='statusBar'>"+
								"<div class='info' id='imgSize' style='display:inline-block; font-size:14px; color:#666666;'></div>"+
            					"<div class='btns'>"+
                					"<div class='addImg'>"+
                    					"<div class='addImg-pick'>�������</div>"+
                        				"<div class='addImg-upload'>"+
                    						"<label><input class='uploadImg' type='file' name='file' accept='image/*' multiple='multiple'/></label>"+
                        				"</div>"+
                    				"</div>"+
                   	 				"<div class='startUpload' id='startUpload'>��ʼ�ϴ�</div>"+
                				"</div>"+
            			"</div>"+
						"<ul class='filelist'>";
			$.each(imgList,function(){
				console.log(this.name);
				console.log(this.size);
				uploadImgs.push(this);
				uploadSize += this.size;
				uploadImgCount++;
				var uploadHTML = "<li>"+
                					"<p class='imgWrap'><img src='images/"+this.name+"' /></p>"+
                    				"<div class='cancel'><span></span></div>"+
                				 "</li>";
				imgHTML += uploadHTML;
			});
			imgHTML += "<li id='readyToAdd' class='continue'>"+
                			"<div class='continueUpload'>"+
                    			"<label><input class='uploadImg' type='file' name='file' accept='image/*' multiple='multiple'/></label>"+
                    		"</div>"+
                		"</li>";
			$("#up-content").empty();
			$("#up-content").html(imgHTML);
			$("#imgSize").html("ѡ��"+uploadImgCount+"��ͼƬ����"+uploadSize/1000+"K");
			/* ������� */
			var continueUpload = $(".uploadImg");
			console.log("��ʱ��uploadImg��:"+continueUpload.length);
			$.each(continueUpload,function(){
				$(this).bind("change",function(){
					var continueImgList = this.files;
					$.each(continueImgList,function(){
						var nextHTML = "<li>"+
                						"<p class='imgWrap'><img src='images/"+this.name+"' /></p>"+
                    					"<div class='cancel'><span></span></div>"+
                				   "</li>";
						$("#readyToAdd").before(nextHTML);
						uploadImgs.push(this);
						uploadSize += this.size;
						uploadImgCount++;
					});
					$("#imgSize").html("ѡ��"+uploadImgCount+"��ͼƬ����"+uploadSize/1000+"K");
				});
			});
			$("#startUpload").bind("click",upload);
		}
		function upload(){
			console.log("��ʼ�ϴ�");
			console.log(uploadImgs.length);
			
			$.each(uploadImgs,function(){
				var formData = new FormData();
				formData.append("filelist",this);
				$.ajax({    
					  type: 'POST',  
					  url: "${base}/UpLoad",
					  data: formData,  
					  async: false,  
					  cache: false,  
					  contentType: false,
					  processData: false,  
					  success: function (returndata) {  
						  alert("hello");  
					  },  
					  error: function (returndata) {  
						  alert("error");  
					  }  
			 	});
			});
		}
	});