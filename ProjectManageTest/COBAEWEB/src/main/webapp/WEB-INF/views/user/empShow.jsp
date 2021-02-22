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
  
	<link href="/resources/plugin/css/jquery-ui.css" rel="stylesheet" />
	<link href="/resources/plugin/css/jquery-ui.structure.css" rel="stylesheet" />
	<link href="/resources/plugin/css/jquery-ui.theme.css" rel="stylesheet" />

    <script src="/resources/plugin/lib/jquery.dataTables.min.js"></script>
    <script src="/resources/plugin/js/jquery.jqGrid.min.js"></script>
    <script src="/resources/plugin/js/grid.locale-kr.js"></script>
    
</head>
<body>
<!--  <form action="${pageContext.request.contextPath}/user/empShow" method="post">
	<table id="jqGrid"></table> 
	<div id="gridpager"></div>
</form>-->

</body>

<script type="text/javascript">

var url = "/user/empShow";


$(document).ready(function() {
	 $.ajax({
		url: url,
		dataType: 'json',
		type : 'POST',
		success : function(data) {
			alert("Success!!!!");
			alert(JSON.stringify(data));
			console.log(data);
       },
       error : function(request, status, error) {
           alert("에러가 발생했습니다. 관리자에게 문의하시기 바랍니다");
           alert(request.status,status);
           //zAjax.fn_error('getTest.do', request, status, error);
       }
	})
	

		
});
	
</script>

</html>
