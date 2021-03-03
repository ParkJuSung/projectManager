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
                    프로젝트정보
                </div>
                <div class="card-body">
					<table id="jqGrid"></table> 
					<div id="gridpager"></div>
					<div>
				  <!--  <input type="button" value="삭제" class="btn btn-primary" onclick="deleteRow()">-->
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
				colNames : ['일련번호','프로젝트코드','프로젝트명','기관코드','예상시작일','예상종료일','실제시작일',
						  '실제종료일','프로젝트상태','등록자','등록일시','수정자','수정일시'],					
				colModel:[ 
				{name:"pjtSeq", index:"pjtSeq", width:55, align:'left', hidden:false }, 
				{name:'pjtCd', index : 'pjtCd', width : 55, align : 'left', hidden:false, },
				{name:'pjtNm', index:'pjtNm', width:75, align:'left', hidden:false },
				{name:'orgSeq', index:'orgSeq', width:70, align:'left', hidden:false },
				{name:'preStrDay', index:'preStrDay', width:60, align:'center', hidden:false },
				{name:'preEndDay', index:'preEndDay', width:150, align:'center', hidden:false },
				{name:'relStrDay', index:'relStrDay', width:90, align:'center', hidden:false },
				{name:'relEndDay', index:'relEndDay', width:90, align:'center', hidden:false },
				{name:'pjtStatCd', index:'pjtStatCd', width:90, align:'center', hidden:false },
				{name:'regId', index:'regId', width:90, align:'center', hidden:false },
				{name:'regDt', index:'regDt', width:90, align:'center', hidden:false },
				{name:'chgId', index:'chgId', width:90, align:'center', hidden:false },
				{name:'chgDt', index:'chgDt', width:90, align:'left', hidden:false }],
					loadtext: "로딩중일때 표시되는 텍스트!", 
					caption: "기관 목록", 
					pager:"#gridpager",
					rowNum:15, 
					multiselect: true,
			});
});

function selectData(){
	
	var url = '/project/pjtShow';
	
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
				colNames : ['일련번호','프로젝트코드','프로젝트명','기관코드','예상시작일','예상종료일','실제시작일',
						  '실제종료일','프로젝트상태','등록자','등록일시','수정자','수정일시'],					
				colModel:[ 
				{name:"pjtSeq", index:"pjtSeq", width:55, align:'left', hidden:false }, 
				{name:'pjtCd', index : 'pjtCd', width : 55, align : 'left', hidden:false, },
				{name:'pjtNm', index:'pjtNm', width:75, align:'left', hidden:false },
				{name:'orgSeq', index:'orgSeq', width:70, align:'left', hidden:false },
				{name:'preStrDay', index:'preStrDay', width:60, align:'center', hidden:false },
				{name:'preEndDay', index:'preEndDay', width:150, align:'center', hidden:false },
				{name:'relStrDay', index:'relStrDay', width:90, align:'center', hidden:false },
				{name:'relEndDay', index:'relEndDay', width:90, align:'center', hidden:false },
				{name:'pjtStatCd', index:'pjtStatCd', width:90, align:'center', hidden:false },
				{name:'regId', index:'regId', width:90, align:'center', hidden:false },
				{name:'regDt', index:'regDt', width:90, align:'center', hidden:false },
				{name:'chgId', index:'chgId', width:90, align:'center', hidden:false },
				{name:'chgDt', index:'chgDt', width:90, align:'left', hidden:false }],
					loadtext: "로딩중일때 표시되는 텍스트!", 
					caption: "기관 목록", 
					pager:"#gridpager",
					rowNum:15, 
					multiselect: true,
					cellEdit:true,
					onCellSelect: function(rowId,colId,cellContent,e){
						//alert("rowID : " + rowId);
						//alert("colId : " + colId);
						if(colId!=0)
						{
							var rowData = $("#jqGrid").jqGrid('getRowData',rowId);
							console.log(rowData);
							pjtOpenChild(rowData.pjtSeq,rowData.pjtCd,rowData.pjtNm,rowData.orgSeq,
									    rowData.preStrDay,rowData.preEndDay,rowData.relStrDay,
									    rowData.relEndDay,rowData.pjtStatCd,rowData.regId,rowData.regDt,
									    rowData.chgId,rowData.chgDt);
						}
					},
			});
	 }
}

var pjtOpenWin;

function pjtOpenChild(pjtSeq,pjtCd,pjtNm,orgSeq,preStrDay,preEndDay,relStrDay,relEndDay,pjtStatCd,
		regId,regDt,chgId,chgDt)
{
	
    // window.name = "부모창 이름";
    window.name = "orgParentForm";
    // window.open("open할 window", "자식창 이름", "팝업창 옵션");
	
	if(pjtOpenWin != null)
	{
		pjtOpenWin.close();
		pjtOpenWin = null;
	}
	
    pjtOpenWin = window.open("/project/pjtEdit",
        "orgChildForm", "width=900, height=950");
	
    pjtOpenWin.onload = function(){
    	pjtSetChildText(pjtSeq,pjtCd,pjtNm,orgSeq,preStrDay,preEndDay,relStrDay,relEndDay,pjtStatCd,
        		regId,regDt,chgId,chgDt);
		//alert("로딩 완료");
	}
    // 일정시간 지연 후 값 넣기
  /*  setTimeout(function () {
        empSetChildText(orgSeq,empNm,empId,empEmail,empPhoneNo,emerNo,empJoinDay,skillLvCd,empDivCd,
        		posCd,statCd);
    }, 350)*/
}

function pjtSetChildText(pjtSeq,pjtCd,pjtNm,orgSeq,preStrDay,preEndDay,relStrDay,relEndDay,pjtStatCd,
		regId,regDt,chgId,chgDt) 
{

    if (pjtOpenWin != null) { 
        pjtOpenWin.document.getElementById("pjtCd").value = pjtCd;
        pjtOpenWin.document.getElementById("pjtNm").value = pjtNm;
        pjtOpenWin.document.getElementById("orgSeq").value = orgSeq;
        pjtOpenWin.document.getElementById("preStrDay").value = preStrDay;
        pjtOpenWin.document.getElementById("preEndDay").value = preEndDay;
        pjtOpenWin.document.getElementById("relStrDay").value = relStrDay;
        pjtOpenWin.document.getElementById("relEndDay").value = relEndDay;
        pjtOpenWin.document.getElementById("pjtStatCd").value = pjtStatCd;
        pjtOpenWin.document.getElementById("regId").value = regId;
        pjtOpenWin.document.getElementById("regDt").value = regDt;
        pjtOpenWin.document.getElementById("chgId").value = chgId;
        pjtOpenWin.document.getElementById("chgDt").value = chgDt;
    }
}
</script>

</html>