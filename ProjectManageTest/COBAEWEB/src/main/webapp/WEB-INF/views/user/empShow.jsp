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
	<table id="jqGrid"></table> 
	<div id="gridpager"></div>

</body>

<script>

jQuery.browser = {};
(function () {
    jQuery.browser.msie = false;
    jQuery.browser.version = 0;
    if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
        jQuery.browser.msie = true;
        jQuery.browser.version = RegExp.$1;
    }
})();

var dataArr = [ {ID:"1",javascript:"80",python:"60",jsp:"50"}, 
	{ID:"2",javascript:"57",python:"80",jsp:"50"}, 
	{ID:"3",javascript:"90",python:"40",jsp:"85"},
	{ID:"4",javascript:"67",python:"84",jsp:"76"}, 
	{ID:"5",javascript:"35",python:"83",jsp:"85"},
	{ID:"6",javascript:"90",python:"67",jsp:"56"},
	{ID:"7",javascript:"80",python:"60",jsp:"50"}, 
	{ID:"8",javascript:"45",python:"67",jsp:"100"}, 
	{ID:"9",javascript:"90",python:"40",jsp:"68"}, 
	{ID:"10",javascript:"67",python:"57",jsp:"76"},
	{ID:"11",javascript:"36",python:"83",jsp:"35"}, 
	{ID:"12",javascript:"76",python:"35",jsp:"98"}, ]; 
	$("#jqGrid").jqGrid({ 
		datatype: "local", 
		data: dataArr, 
		height: 250, 
		width: 500, 
		colNames : ['ID','자바스크립트','파이썬','JSP'], 
		colModel:[ 
			{name:"ID", index:"ID", width:15, align:'center', hidden:false }, 
			{name : 'javascript', index : 'javascript', width : 70, align : 'left', hidden:false, }, 
			{name : 'python', index : 'python', width : 70, align : 'center', hidden:false }, 
			{name : 'jsp', index : 'jsp', width : 70, resizable : true, align : 'right', hidden:false }], 
			loadtext: "로딩중일때 표시되는 텍스트!", 
			caption: "jQuery Grid: jqGrid 샘플", 
			pager:"#gridpager",
			rowNum:5, 
			//rownumbers:true, 
			//viewrecords:true,
			//pgbuttons:true, 
			//pginput:true, 
			//shrinkToFit:true, 
			//sortable: false, 
			//loadComplete:function(data){}, 
			//scroll:true, 
			//loadonce:false, 
			//hidegrid:true 
	});



</script>
</html>
