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
      
</head>
<body class="sb-nav-fixed">

<!-- 상단 메뉴 부분 -->
<c:import url="/WEB-INF/views/include/top.jsp"/>

<div id="layoutSidenav">

    <!-- 사이드 메뉴 부분 -->
    <c:import url="/WEB-INF/views/include/side.jsp"/>

    <div id="layoutSidenav_content">

        <main>
            <div class="card mb-4">
                <div class="card-header">
                    <i class="fas fa-table mr-1"></i>
                    직원정보
                </div>
                <div class="card-body">
					<table id="jqGrid"></table> 
					<div id="gridpager"></div>
                </div>
            </div>
        </main>
        <!-- 하단 사이드 메뉴 부분 -->
        <c:import url="/WEB-INF/views/include/bottom.jsp"/>
    </div>
</div>
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
					height: 500, 
					width: 1200, 
					colNames : ['empSeq','orgSeq','empDivCd','empId','empNm','empEail','empPhoneNo','emerNo','empJoinDay','skillLvCd','posCd','statCd','chgid','chgDt'], 
					colModel:[ 
						{name:"empSeq", index:"empSeq", width:55, align:'left', hidden:false }, 
						{name : 'orgSeq', index : 'orgSeq', width : 55, align : 'left', hidden:false, },
						{name:'empDivCd', index:'empDivCd', width:65, align:'left', hidden:false },
						{name:'empId', index:'empId', width:70, align:'left', hidden:false },
						{name:'empNm', index:'empNm', width:60, align:'center', hidden:false },
						{name:'empEmail', index:'empEmail', width:150, align:'center', hidden:false },
						{name:'empPhoneNo', index:'empPhoneNo', width:90, align:'center', hidden:false },
						{name:'emerNo', index:'emerNo', width:90, align:'center', hidden:false },
						{name:'empJoinDay', index:'empJoinDay', width:70, align:'center', hidden:false },
						{name:'skillLvCd', index:'skillLvCd', width:55, align:'center', hidden:false },
						{name:'posCd', index:'posCd', width:45, align:'center', hidden:false },
						{name:'statCd', index:'statCd', width:50, align:'center', hidden:false },
						{name:'chgid', index:'chgid', width:45, align:'center', hidden:false },
						{name:'chgDt', index:'chgDt', width:45, align:'left', hidden:false }],
						loadtext: "로딩중일때 표시되는 텍스트!", 
						caption: "직원 목록", 
						pager:"#gridpager",
						rowNum:20, 
				});
	 }
		});


	
</script>

</html>
