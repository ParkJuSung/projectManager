<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<%@ include file="/resources/plugin/plugin.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Focusleader Project Manager</title>
 <!--     <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />-->
  <!--     <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>   -->
  
	<link href="/resources/plugin/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
	<link href="/resources/plugin/css/ui.jqgrid.css" rel="stylesheet" type="text/css"/>
	<!--  <link href="/resources/plugin/css/jquery-ui.structure.css" rel="stylesheet" />-->
	<!--  <link href="/resources/plugin/css/jquery-ui.theme.css" rel="stylesheet" />-->

    <!--  <script type="text/javascript" src="/resources/plugin/lib/jquery.dataTables.min.js"></script> -->
   	<!--  <script type="text/javascript" src="/resources/plugin/js/jquery.jqGrid.min.js"></script>-->
    <script type="text/javascript" src="/resources/plugin/js/jquery.jqGrid.src.js"></script> 
    <script type="text/javascript" src="/resources/plugin/js/grid.locale-kr.js"></script> 
    
</head>
<body>
	<table id="jqGrid"></table> 
	<div id="gridpager"></div>
</form>

</body>

<script type="text/javascript">

var url = '/user/empShow';

$(document).ready(function() {
	jQuery.browser = {};
	(function () {
	    jQuery.browser.msie = false;
	    jQuery.browser.version = 0;
	    if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
	        jQuery.browser.msie = true;
	        jQuery.browser.version = RegExp.$1;
	    }
	})();
	
	 $.ajax({
		url: url,
		dataType: 'json',
		type : 'POST',
		success : function(data) {
		//	alert("Success!!!!");
		//	console.log(data);
		//	console.log(data.rows[0].emerNo);
			fn_listSuccess(data);
       },
       error : function(request, status, error) {
           alert("에러가 발생했습니다. 관리자에게 문의하시기 바랍니다");
       //    alert(request);
       //    console.log(request);
           alert(request.status,status);
           //zAjax.fn_error('getTest.do', request, status, error);
       }
	})
	
	function fn_listSuccess(data){
		 var dataArr = data.rows;
		 console.log(dataArr);
				$("#jqGrid").jqGrid({ 
					datatype: "local", 
					data: dataArr, 
					height: 250, 
					width: 1050, 
					colNames : ['empSeq','orgSeq','empDivCd','empId','empNm','empEail','empPhoneNo','emerNo','empJoinDay','skillLvCd','posCd','statCd','chgid','chgDt'], 
					colModel:[ 
						{name:"empSeq", index:"empSeq", width:40, align:'left', hidden:false }, 
						{name : 'orgSeq', index : 'orgSeq', width : 15, align : 'left', hidden:false, },
						{name:'empDivCd', index:'empDivCd', width:20, align:'left', hidden:false },
						{name:'empId', index:'empId', width:35, align:'left', hidden:false },
						{name:'empNm', index:'empNm', width:50, align:'left', hidden:false },
						{name:'empEmail', index:'empEmail', width:70, align:'left', hidden:false },
						{name:'empPhoneNo', index:'empPhoneNo', width:60, align:'left', hidden:false },
						{name:'emerNo', index:'emerNo', width:60, align:'left', hidden:false },
						{name:'empJoinDay', index:'empJoinDay', width:55, align:'left', hidden:false },
						{name:'skillLvCd', index:'skillLvCd', width:40, align:'left', hidden:false },
						{name:'posCd', index:'posCd', width:40, align:'left', hidden:false },
						{name:'statCd', index:'statCd', width:15, align:'left', hidden:false },
						{name:'chgid', index:'chgid', width:25, align:'left', hidden:false },
						{name:'chgDt', index:'chgDt', width:25, align:'left', hidden:false }],
						loadtext: "로딩중일때 표시되는 텍스트!", 
						caption: "직원 목록", 
						pager:"#gridpager",
						rowNum:5, 
				});
	 }
		});


	
</script>

</html>
