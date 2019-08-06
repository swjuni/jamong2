<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<!--[if IE 9]> <html class="no-js ie9 fixed-layout" lang="en"> <![endif]-->
<!--[if gt IE 9]><!--> <html class="no-js " lang="en"> <!--<![endif]-->
<head>
<%@include file="../incs/head_mypage.jsp" %>
<meta charset="UTF-8">
<title>profileFrame</title>
<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
<script type="text/javascript">
$(function(){
	$("select[name=majorSelected]").find('option').each(function(index, item){
		var cateL=$(this).text();
		var cateNo=$(this).val();
		findcateM(cateL, cateNo);
	});
	
	$("select[name=major] option").dblclick(function(){
		if($(".submajor:eq(2)").length){
			alert("전문분야는 3항목까지 선택가능합니다.");
			return false;
		}
		var cateL=$(this).text();
		var cateNo=$(this).val();
		$(this).hide();
		$("<option value='"+$(this).val()+"'>"+$(this).text()+"</option>").appendTo($("select[name=majorSelected]"));
		$.ajax({
			url:"<c:url value='/mypage/submajor.do'/>",
			type:"get",
			data:"categoryLNo="+cateNo,
			dataType:"json",
			success:function(res){
				var str="<div id='"+cateNo+"' class='submajor' style='margin-bottom:25px; padding: 12px 12px; background: #f5f5f5;'><p><a>"+cateL+"</a></p>"
				$.each(res, function(idx, item){
					var id=item.categoryName.replace(" ","");
					var cateName=id.replace(".","");
					str+="<span id='"+cateName+item.categoryNoM+"' >"+ item.categoryName +"</span><input type='hidden' value='"+item.categoryNoM+"'>";
				});
				
				str+="</div>";
				$("li:eq(0)").append(str);
				$("#submajorSelected").append("<p><a>"+cateL+"</a></p>");
			},
			error:function(xhr, status, error){
				alert(status+":"+error);
			}
		});//ajax
	});
	
	$(document).on("dblclick",("select[name=majorSelected] option"),function(){
		$("#"+$(this).val()).find('span').each(function(index, item1){
			$("#submajorSelected").find('span').each(function(index, item2){
				if($(item1).text()==$(item2).text()){
					$(item2).next().remove();
					$(item2).remove();
				}
			});
		});
		
		var text=$(this).text();
		$("#submajorSelected").find('p').each(function(index, item3){
			if(text==$(item3).text()){
				$(item3).remove();
			}
		});
		
		$(this).remove();
		$("select[name=major] option[value='"+$(this).val()+"']").show();
		$("#"+$(this).val()).remove();
	});
	
	$(document).on("click",(".submajor span"),function(){
		$("#submit").attr("disabled",false);
		var no=$(this).next().val();
		var value=$(this).html();
		var re=$(this).prevAll('p:first').text();
		$(this).hide();
		$("#submajorSelected").find('p').each(function(index, item){
			if($(this).text()==re){
				$(this).after("<span>"+value+"</span><input name='major2' type='hidden' value='"+no+"'>");
			}
		});
	});
	
	$(document).on("click",("#submajorSelected span"),function(){
		if($("#submajorSelected span").length==1){
			$("#submit").attr("disabled","disabled");	
		}
		var id=$(this).text().replace(" ","");
		var realid=id.replace(".","");
		$("#"+realid+$(this).next().val()).show();
		$(this).next().remove();
		$(this).remove();
	});
	
});
	function findcateM(cateL, cateNo){
		var except=$("input[name=except]").val();
		$.ajax({
			url:"<c:url value='/mypage/submajor.do'/>",
			type:"get",
			data:"categoryLNo="+cateNo,
			dataType:"json",
			success:function(res){
				var str="<div id='"+cateNo+"' class='submajor' style='margin-bottom:25px; padding: 12px 12px; background: #f5f5f5;'><p><a>"+cateL+"</a></p>"
				var str2="";
				$.each(res, function(idx, item){
					var id=item.categoryName.replace(" ","");
					var cateName=id.replace(".","");
					if(except.indexOf(item.categoryNoM)!=-1){
						str+="<span id='"+cateName+item.categoryNoM+"' style='display:none;'>"+ item.categoryName +"</span><input type='hidden' value='"+item.categoryNoM+"'>";
						str2+="<span>"+item.categoryName+"</span><input name='major2' type='hidden' value='"+item.categoryNoM+"'>";
					}else{
						str+="<span id='"+cateName+item.categoryNoM+"' >"+ item.categoryName +"</span><input type='hidden' value='"+item.categoryNoM+"'>";
					}
				});
				
				str+="</div>";
				$("li:eq(0)").append(str);
				var append=$("#submajorSelected").append("<p><a>"+cateL+"</a></p>"+str2);
			},
			error:function(xhr, status, error){
				alert(status+":"+error);
			}
		});//ajax
	}
	
</script>
<style type="text/css">
	body{
		background: white;
	}

	li div{
		width: 100%;
	}
	
	li{
		list-style: none;
	}
	
	.btn{
		margin-right: 22px;
		padding: 10px;
		width: 80px;
		float:right;
		margin-top: 20px;
	}
	
	span{
		background: #f58566bf;
		color:white;
		padding:4px 9px;
		border-radius:12px;
		margin-right:5px;
		cursor:pointer;
		display: -webkit-inline-box;
	}
</style>
</head>
<body>
	<form name="frm" role="form" class="contactform" action="<c:url value='/mypage/registMajor.do'/>" method="post">
	<input name="expertNo" type="hidden" value="${expert.expertNo }">
		<div style="margin-top:30px;">
		<input type="hidden" value="${majorM }" name="except">
									<p><a>&nbsp;전문분야 선택</a></p>
									<div class="major">
										<select name="major" multiple="multiple" style="width: 200px;height: 130px; float: left;">
										<c:forEach var="cateLvo" items="${list }">
											<c:if test="${fn:indexOf(majorL,cateLvo.categoryNo)!=-1 }">
												<option value="${cateLvo.categoryNo }" style="display: none;">${cateLvo.categoryNameL }</option>
											</c:if>
											<c:if test="${fn:indexOf(majorL,cateLvo.categoryNo)==-1 }">
												<option value="${cateLvo.categoryNo }">${cateLvo.categoryNameL }</option>
											</c:if>
										</c:forEach>
										</select>
										<br>
										<p style="margin-top: 25px; float: left;"><a style="margin-left: 55px;">▶▶</a></p>
										<select name="majorSelected" multiple="multiple" style="width: 200px;height: 130px; margin-top: -28px;margin-left: 55px;">
										<c:forEach var="cateLvo" items="${list }">
										<c:if test="${fn:indexOf(majorL,cateLvo.categoryNo)!=-1 }">
												<option value="${cateLvo.categoryNo }">${cateLvo.categoryNameL }</option>
										</c:if>
										</c:forEach>
										</select>
									</div>
								</div>
								</li>
								<li style="border-bottom: 1px whitesmoke dashed;">
									<div style="margin-top:30px;">
									<p><a>&nbsp;상세분야 선택</a></p>
									</div>
								</li>
								<li>
								<p style="margin-top: 10px;"><a>&nbsp;내 전문분야</a></p>
									<div style="background: whitesmoke; margin-bottom: 12px; padding: 10px;" id="submajorSelected">
									</div>
								</li>
							</ul>
		<button type="button" id="next" name="next"	class="btn btn-primary"
			onclick="location.href='<c:url value="/mypage/licenseView.do?expertNo=${expert.expertNo }"/>'" style="margin-right: 220px;"
		<c:if test='${empty majorM }'>
			disabled="disabled"
		</c:if>
		>다음</button>
		<button type="submit" id="submit" name="submit"	class="btn btn-primary"
		<c:if test='${empty majorM }'>
			disabled="disabled"
		</c:if>
		>저장</button>
		<br>
		<br>
	</form>
</body>
</html>