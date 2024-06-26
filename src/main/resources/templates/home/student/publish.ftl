<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
<title>${siteName!""}-Post products</title>
<link rel="icon" href="/home/imgs/favicon.ico" type="image/x-icon">
<link media="all" href="/home/css/release_product.css" type="text/css" rel="stylesheet">
<link media="all" href="/home/css/index.css" type="text/css" rel="stylesheet">
</head>
<body>
  <#include "../common/top_header.ftl"/>
   <div class="container">
            <div class="main center">
                <img class="release-icon-main" src="/home/imgs/release-icon.png" alt="">
                <div class="wave-fluid"></div>
                <div class="release-title">Publish products</div>
                <form action="publish" id="publish-form" method="post">
                <div class="form-wr">
                    <div class="form-must-wr">
                    	
                    	<input id="photo" type="hidden" name="photo" value="" class="required" tips="Please upload picture">
                    	
                    	<div id="show-img" class="form-item l goods-title" style="height:100px;display:none;">
                            <div class="form-key">
                                <span>Picture uploaded</span></div>
                            <div class="form-value">
                                <div class="form-input-wr">
                                	<img id="uploaded-img" src="/home/imgs/release-icon.png" width="100px" height="100px">
                                </div>
                            </div>
                        </div>
                    	
                    	<div class="form-item l goods-title">
                            <div class="form-key">
                                <span>Select picture</span></div>
                            <div class="form-value">
                                <div class="form-input-wr">
                                	<input type="file" id="uploadFile" />
                                </div>
                            </div>
                        </div>
                    	
                        <div class="form-item l goods-title">
                            <div class="form-key">
                                <span>Product name</span></div>
                            <div class="form-value">
                                <div class="form-input-wr">
                                    <input id="name" name="name" placeholder="Maximum 18 words" maxlength="18" value="" type="text" class="required" tips="Please fill in the name"></div>
                            </div>
                        </div>
                        
                        <div class="form-item xl goods-desc">
                            <div class="form-key">
                                <span>Prouct detail</span></div>
                            <div class="form-value">
                                <div class="form-input-wr">
                                    <textarea name="content" id="desc" placeholder="Please tell us more about your product. At least 15 words" class="required" tips="Please fill in the detail"></textarea>
                                </div>
                            </div>
                        </div>
                        
                        
                        <div class="form-item l goods-price">
                            <div class="form-key">
                                <span>I bought for:</span></div>
                            <div class="form-value">
                                <div class="form-input-wr">
                                    <input class="price required" id="buyPrice" name="buyPrice" value="" type="number" tips="Please fill the price"></div>
                            </div>
                        </div>
                        <div class="form-item l goods-price">
                            <div class="form-key">
                                <span>Selling price</span></div>
                            <div class="form-value">
                                <div class="form-input-wr">
                                    <input class="price required" id="sellPrice" name="sellPrice" value="" type="number" tips="Please fill in the selling price"></div>
                            </div>
                        </div>
                        
                          

                        <!--选择分类信息 -->
                        <div class="form-item l goods-cat">
                            <div class="form-key">
                                <span>Category</span>
                            </div>
                             <div class="form-value">
                                <div class="form-input-wr">
								    <select id="cid" style="width: 40%;height: 28px;color: rgb(68, 68, 68);font-size: 1.17em;line-height: 28px;background-color: transparent;"> 
										<option>---Please Select----</option> 
										<#if goodsCategorys??>
										<#list goodsCategorys as goodsCategory>
											<#if goodsCategory.parent??>
											<#else>
											<option value="${goodsCategory.id}">${goodsCategory.name}</option> 
											</#if>
										</#list>
										</#if>
								   </select> 
								   <select id="cid2" name="goodsCategory.id" style="width: 40%;height: 28px;color: rgb(68, 68, 68);font-size: 1.17em;line-height: 28px;background-color: transparent;"> 
								   		<option value="-1">----Please select----</option>
								   		<#if goodsCategorys??>
										<#list goodsCategorys as goodsCategory>
								   		<#if goodsCategory.parent??>
										<option style="display:none;" value="${goodsCategory.id}" pid="${goodsCategory.parent.id}">${goodsCategory.name}</option> 
										</#if>
										</#list>
										</#if>
								   </select> 
							    </div>
                            </div>
                        </div> 
                        
                        
                        
                    </div>
                    
                   	<input class="form-submit" id="submit-btn" type="button" value="发布" />
                  </div>
                  </form>
            </div>
        </div>
 	<#include "../common/right_menu.ftl"/>
	<#include "../common/bottom_footer.ftl"/> 
<script  src="/home/js/jquery-3.1.1.min.js"></script>
<script src="/home/js/common.js"></script>
<script src="/home/js/add.js"></script>
<script type="text/javascript">
$(document).ready(function(){
   $("#cid").change(function(){
	    var cid = $(this).val();
	    $("#cid2 option[value='-1']").prop("selected", true);
		$("#cid2 option[value!='-1']").css({'display':'none'});
		$("#cid2 option").each(function(i,e){
			if($(e).attr('pid') == cid){
				$(e).css({'display':'block'})
			}
		});
   });
   $("#submit-btn").click(function(){
   		var flag = true;
   		$(".required").each(function(i,e){
   			if($(e).val() == ''){
   				alert($(e).attr('tips'));
   				flag = false;
   				return false;
   			}
   		});
   		if(flag){
   			if($("#desc").val().length < 15){
	   			alert('At least 15 words！');
	   			return;
	   		}
	   		if(parseFloat($("#buyPrice").val()) == 'NaN'){
	   			alert('Price can only contain number！');
	   			return;
	   		}
	   		if(parseFloat($("#sellPrice").val()) == 'NaN'){
	   			alert('Price can only contain number！');
	   			return;
	   		}
	   		//检查分类
	   		if($("#cid2").val() == '' || $("#cid2").val() == '-1'){
	   			alert('Please select the category！');
	   			return;
	   		}
	   		//全部符合，准备提交表单
	   		ajaxRequest('publish','post',$("#publish-form").serialize(),function(){
	   			window.location.href="index";
	   		});
   		}
   });
   //监听文件按钮
   $("#uploadFile").change(function(){
   		uploadPhoto('uploaded-img','photo');
   })

});
function uploadPhoto(showPictureImg,input){
	//formdata
	var formData = new FormData();
	formData.append('photo',document.getElementById('uploadFile').files[0]);
	$.ajax({
		url:'/home/upload/upload_photo',
		contentType:false,
		processData:false,
		data:formData,
		type:'POST',
		success:function(data){
				$('.loading').addClass("hide")
				if(data.code == 0){
					$("#show-img").show();
					$("#"+showPictureImg).attr('src','/photo/view?filename=' + data.data);
					$("#"+input).val(data.data);
					
				}else{
					data = $.parseJSON(data);
					alert(data.msg);
				}
			},
			error:function(data){
				alert('Erro!');
			}
	});
}
</script>	
</html>