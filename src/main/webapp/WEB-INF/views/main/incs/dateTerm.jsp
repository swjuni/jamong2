<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jquery-ui.min.css'/>">
<script type="text/javascript">
	$(function(){
		$.setToday();
		
		$('#btWeek').click(function(){
			$.setDate('d', 7);	//1주일전
		});
		
		$('#btMonth1').click(function(){
			$.setDate('m', 1);	//1개월전
		});
		
		$('#btMonth3').click(function(){
			$.setDate('m', 3);	//3개월전
		});
		
		$("#startDay").datepicker({
			dateFormat:"yy-mm-dd",
			changeYear:true,
			dayNamesMin:["일","월","화","수","목","금","토"],
			monthNames:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"]
		});
		
		$("#endDay").datepicker({
			dateFormat:"yy-mm-dd",
			changeYear:true,
			dayNamesMin:["일","월","화","수","목","금","토"],
			monthNames:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"]
		});
		
	});
	
	$.setToday=function(){
		if($('#startDay').val()==''){
			var d = new Date();
			var str=$.findDate(d);
			$('#startDay').val(str);
			$('#endDay').val(str);
		}
	}
	
	$.findDate=function(d){
		var str = d.getFullYear() + "-" + $.formatDate(d.getMonth()+1) + "-" + $.formatDate(d.getDate());
		return str;
	}
	
	$.formatDate=function(m){
		if(m<10){	//m.length=1
			return "0"+m;
		}else{
			return m;
		}
	}
	
	$.setDate=function(type, term){
		var endDate = $('#endDay').val();	//2019-07-08
		var arr = endDate.split('-');
		var date = new Date(arr[0],arr[1]-1,arr[2]);	//(2019, 6, 8)
		if(type=='d'){
			date.setDate(date.getDate()-term);
		}else if(type=='m'){
			date.setMonth(date.getMonth()-term);
		}
		var str=$.findDate(date);
		$('#startDay').val(str);
	}

</script>
<div class="divLeft">
	<input type="button" class="btn btn-secondary btn-sm" value="1주일" id="btWeek">
	<input type="button" class="btn btn-secondary btn-sm"value="1개월" id="btMonth1">
	<input type="button" class="btn btn-secondary btn-sm"value="3개월" id="btMonth3">
</div>
<div class="divRight">
	<input type="text" name="startDay" id="startDay" value="${param.startDay }" class="searchInput"> 
	<!--컨트롤러 model에서 공유한 dateSearchVO를 직접 호출해서 orderList.do 페이지를 처음 불러올 때
		해당 메서드에서 세팅한 startDay가 공유되어 바로 자동 입력된다 -->
	~ 
	<input type="text" name="endDay" id="endDay" value="${dateSearchVO.endDay }" class="searchInput">
	<input type="submit" class="btn btn-warning btn-sm" value="조회" >
</div>