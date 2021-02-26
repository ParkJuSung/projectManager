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
					<div>
						<input type="button" value="삭제" class="btn btn-primary" onclick="deleteRow()">
						<input type="button" value="조회" class="btn btn-primary" onclick="selectData()">
					</div>
                </div>
            </div>
        </main>
        <!-- 하단 사이드 메뉴 부분 -->
        <c:import url="/WEB-INF/views/include/bottom.jsp"/>
    </div>
</div>
</body>

<script type="text/javascript">


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

		//단순히 그리드 그리기
			$("#jqGrid").jqGrid({ 
				height: 500, 
				width: 1450, 
				colNames : ['직원일련번호','기관일련번호','구분','사번','이름','이메일','핸드폰번호',
						  '비상연락처','입사일','기술등급','직위','상태','등록자사번','등록일','수정자사번','수정일'],					
				colModel:[ 
				{name:"empSeq", index:"empSeq", width:55, align:'left', hidden:false }, 
				{name:'orgSeq', index : 'orgSeq', width : 55, align : 'left', hidden:false, },
				{name:'empDivCd', index:'empDivCd', width:75, align:'left', hidden:false },
				{name:'empId', index:'empId', width:70, align:'left', hidden:false },
				{name:'empNm', index:'empNm', width:60, align:'center', hidden:false },
				{name:'empEmail', index:'empEmail', width:150, align:'center', hidden:false },
				{name:'empPhoneNo', index:'empPhoneNo', width:90, align:'center', hidden:false },
				{name:'emerNo', index:'emerNo', width:90, align:'center', hidden:false },
				{name:'empJoinDay', index:'empJoinDay', width:70, align:'center', hidden:false },
				{name:'skillLvCd', index:'skillLvCd', width:55, align:'center', hidden:false },
				{name:'posCd', index:'posCd', width:45, align:'center', hidden:false },
				{name:'statCd', index:'statCd', width:50, align:'center', hidden:false },
				{name:'regId', index:'regId', width:90, align:'center', hidden:false },
				{name:'regDt', index:'regDt', width:90, align:'center', hidden:false },
				{name:'chgId', index:'chgId', width:90, align:'center', hidden:false },
				{name:'chgDt', index:'chgDt', width:90, align:'left', hidden:false }],
					loadtext: "로딩중일때 표시되는 텍스트!", 
					caption: "직원 목록", 
					pager:"#gridpager",
					rowNum:15, 
					multiselect: true,
			});
});

function selectData(){
	
	var url = '/user/empShow';
	
	//값가져오기
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
	
	//그리기
	function fn_listSuccess(data){
		 var dataArr = data.rows;
		 console.log(dataArr);
		 $("#jqGrid").jqGrid("GridUnload");
				$("#jqGrid").jqGrid({ 
					datatype: "local", 
					data: dataArr, 
					height: 500, 
					width: 1450, 
					colNames : ['직원일련번호','기관일련번호','구분','사번','이름','이메일','핸드폰번호',
						  		'비상연락처','입사일','기술등급','직위','상태','등록자사번','등록일','수정자사번','수정일'], 
					colModel:[ 
						{name:"empSeq", index:"empSeq", width:55, align:'left', hidden:false }, 
						{name : 'orgSeq', index : 'orgSeq', width : 55, align : 'left', hidden:false, },
						{name:'empDivCd', index:'empDivCd', width:75, align:'left', hidden:false },
						{name:'empId', index:'empId', width:70, align:'left', hidden:false },
						{name:'empNm', index:'empNm', width:60, align:'center', hidden:false },
						{name:'empEmail', index:'empEmail', width:150, align:'center', hidden:false },
						{name:'empPhoneNo', index:'empPhoneNo', width:90, align:'center', hidden:false },
						{name:'emerNo', index:'emerNo', width:90, align:'center', hidden:false },
						{name:'empJoinDay', index:'empJoinDay', width:70, align:'center', hidden:false },
						{name:'skillLvCd', index:'skillLvCd', width:55, align:'center', hidden:false },
						{name:'posCd', index:'posCd', width:45, align:'center', hidden:false },
						{name:'statCd', index:'statCd', width:50, align:'center', hidden:false },
						{name:'regId', index:'regId', width:90, align:'center', hidden:false },
						{name:'regDt', index:'regDt', width:90, align:'center', hidden:false },
						{name:'chgId', index:'chgId', width:90, align:'center', hidden:false },
						{name:'chgDt', index:'chgDt', width:90, align:'left', hidden:false }],
						loadtext: "로딩중일때 표시되는 텍스트!", 
						caption: "직원 목록", 
						pager:"#gridpager",
						rowNum:15, 
						multiselect: true,
						cellEdit:true,
						autowidth:true,
						onCellSelect: function(rowId,colId,cellContent,e){
							//alert("rowID : " + rowId);
							//alert("colId : " + colId);
							
							if(colId!=0)
							{
								var rowData = $("#jqGrid").jqGrid('getRowData',rowId);
								console.log(rowData);
								empOpenChild(rowData.orgSeq,rowData.empNm,rowData.empId,rowData.empEmail,
										    rowData.empPhoneNo,rowData.emerNo,rowData.empJoinDay,
										    rowData.skillLvCd,rowData.empDivCd,rowData.posCd,rowData.statCd);
							}
						},
				});
	 }
	
	
}
//삭제
function deleteRow(){
		
		var id = $("#jqGrid").getGridParam('selarrrow');
		var dataArr = [];
		var delurl = "empDelete";
		for(var i = 0; i<id.length;i++)
		{
			var rowdata = $("#jqGrid").getRowData(id[i]);
			dataArr.push(rowdata.empId);
			
			//data+= + ',';
		}
		
		if(id.length == 0)
		{
			alert("삭제할 Data를 선택하세요");
			return false
		}
		else{
			if(id.length> 0 )
			{
				if(confirm("선택한 Data를 삭제하시겠습니까?") == false)
					return false
				
				$.ajax({
				//	dataType: "json",
					type: "POST",
					url: delurl,
					traditional : true,
				data:{
					dataArr: dataArr
				},
				success:function(response, textStatus, xhr){
				//	alert("s." + textStatus);
				//	location.replace("empShow")
					$("#jqGrid").jqGrid('setGridParam',{
						url: delurl,
						traditional : true,
					//	datatyp: "json",
					});
					selectData();
				},
					error:function(e){
						alert("삭제 실패");
					}
				});
			}
		}
	}

// 수정하기 위한 팝업창 열기
var empOpenWin;

function empOpenChild(orgSeq,empNm,empId,empEmail,empPhoneNo,emerNo,empJoinDay,skillLvCd,empDivCd,
		posCd,statCd)
{
	
    // window.name = "부모창 이름";
    window.name = "empParentForm";
    // window.open("open할 window", "자식창 이름", "팝업창 옵션");
	
	if(empOpenWin != null)
	{
		empOpenWin.close();
		empOpenWin = null;
	}
	
    empOpenWin = window.open("/user/empEdit",
        "childForm", "width=570, height=950");
	
	empOpenWin.onload = function(){
        empSetChildText(orgSeq,empNm,empId,empEmail,empPhoneNo,emerNo,empJoinDay,skillLvCd,empDivCd,
        		posCd,statCd);
		//alert("로딩 완료");
	}
    // 일정시간 지연 후 값 넣기
  /*  setTimeout(function () {
        empSetChildText(orgSeq,empNm,empId,empEmail,empPhoneNo,emerNo,empJoinDay,skillLvCd,empDivCd,
        		posCd,statCd);
    }, 350)*/
}

function empSetChildText(orgSeq,empNm,empId,empEmail,empPhoneNo,emerNo,empJoinDay,skillLvCd,empDivCd,
		posCd,statCd) 
{

    if (empOpenWin != null) { 
    	empOpenWin.document.getElementById("orgSeq").value = orgSeq;
        empOpenWin.document.getElementById("empNm").value = empNm;
        empOpenWin.document.getElementById("empId").value = empId;
        empOpenWin.document.getElementById("empEmail").value = empEmail;
        empOpenWin.document.getElementById("empPhoneNo").value = empPhoneNo;
        empOpenWin.document.getElementById("emerNo").value = emerNo;
        empOpenWin.document.getElementById("empJoinDay").value = empJoinDay;
        empOpenWin.document.getElementById("skillLvCd").value = skillLvCd;
        empOpenWin.document.getElementById("empDivCd").value = empDivCd;
        empOpenWin.document.getElementById("posCd").value = posCd;
        empOpenWin.document.getElementById("statCd").value = statCd;
    }
}


</script>

</html>
