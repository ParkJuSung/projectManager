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
                    기관정보
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
				colNames : ['일련번호','기관코드','기관명','기관구분','사업자번호','대표자명','기관대표전화',
						  '기관팩스번호','기관우편번호','기관주소1','기관주소2','영업대표명','영업대표번호','등록자','등록일시','수정자','수정일시'],					
				colModel:[ 
				{name:"orgSeq", index:"orgSeq", width:55, align:'left', hidden:false }, 
				{name:'orgCd', index : 'orgCd', width : 55, align : 'left', hidden:false, },
				{name:'orgNm', index:'orgNm', width:75, align:'left', hidden:false },
				{name:'orgDivCd', index:'orgDivCd', width:70, align:'left', hidden:false },
				{name:'bizNo', index:'bizNo', width:60, align:'center', hidden:false },
				{name:'ceoNm', index:'ceoNm', width:150, align:'center', hidden:false },
				{name:'orgTellNo', index:'orgTellNo', width:90, align:'center', hidden:false },
				{name:'orgFaxNo', index:'orgFaxNo', width:90, align:'center', hidden:false },
				{name:'orgZip', index:'orgZip', width:90, align:'center', hidden:false },
				{name:'orgAddr', index:'orgAddr', width:70, align:'center', hidden:false },
				{name:'orgAddr2', index:'orgAddr2', width:55, align:'center', hidden:false },
				{name:'orgSailNm', index:'orgSailNm', width:45, align:'center', hidden:false },
				{name:'orgSailPhone', index:'orgSailPhone', width:50, align:'center', hidden:false },
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
	
	var url = '/organization/orgShow';
	
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
				colNames : ['일련번호','기관코드','기관명','기관구분','사업자번호','대표자명','기관대표전화',
						  '기관팩스번호','기관우편번호','기관주소1','기관주소2','영업대표명','영업대표번호','등록자','등록일시','수정자','수정일시'],					
				colModel:[ 
				{name:"orgSeq", index:"orgSeq", width:55, align:'left', hidden:false }, 
				{name:'orgCd', index : 'orgCd', width : 55, align : 'left', hidden:false, },
				{name:'orgNm', index:'orgNm', width:75, align:'left', hidden:false },
				{name:'orgDivCd', index:'orgDivCd', width:70, align:'left', hidden:false },
				{name:'bizNo', index:'bizNo', width:60, align:'center', hidden:false },
				{name:'ceoNm', index:'ceoNm', width:150, align:'center', hidden:false },
				{name:'orgTellNo', index:'orgTellNo', width:90, align:'center', hidden:false },
				{name:'orgFaxNo', index:'orgFaxNo', width:90, align:'center', hidden:false },
				{name:'orgZip', index:'orgZip', width:90, align:'center', hidden:false },
				{name:'orgAddr1', index:'orgAddr1', width:70, align:'center', hidden:false },
				{name:'orgAddr2', index:'orgAddr2', width:55, align:'center', hidden:false },
				{name:'orgSailNm', index:'orgSailNm', width:45, align:'center', hidden:false },
				{name:'orgSailPhone', index:'orgSailPhone', width:50, align:'center', hidden:false },
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
							orgOpenChild(rowData.orgSeq,rowData.orgCd,rowData.orgNm,rowData.orgDivCd,
									    rowData.bizNo,rowData.ceoNm,rowData.orgTellNo,
									    rowData.orgFaxNo,rowData.orgZip,rowData.orgAddr1,rowData.orgAddr2,
									    rowData.orgSailNm,rowData.orgSailPhone);
						}
					},
					
			});
	 }
}

var orgOpenWin;

function orgOpenChild(orgSeq,orgCd,orgNm,orgDivCd,bizNo,ceoNm,orgTellNo,orgFaxNo,orgZip,
		orgAddr1,orgAddr2,orgSailNm,orgSailPhone)
{
	
    // window.name = "부모창 이름";
    window.name = "orgParentForm";
    // window.open("open할 window", "자식창 이름", "팝업창 옵션");
	
	if(orgOpenWin != null)
	{
		orgOpenWin.close();
		orgOpenWin = null;
	}
	
    orgOpenWin = window.open("/organization/orgEdit",
        "orgChildForm", "width=570, height=950");
	
	orgOpenWin.onload = function(){
        orgSetChildText(orgSeq,orgCd,orgNm,orgDivCd,bizNo,ceoNm,orgTellNo,orgFaxNo,orgZip,
        		orgAddr1,orgAddr2,orgSailNm,orgSailPhone);
		//alert("로딩 완료");
	}
    // 일정시간 지연 후 값 넣기
  /*  setTimeout(function () {
        empSetChildText(orgSeq,empNm,empId,empEmail,empPhoneNo,emerNo,empJoinDay,skillLvCd,empDivCd,
        		posCd,statCd);
    }, 350)*/
}

function orgSetChildText(orgSeq,orgCd,orgNm,orgDivCd,bizNo,ceoNm,orgTellNo,orgFaxNo,orgZip,
		orgAddr1,orgAddr2,orgSailNm,orgSailPhone) 
{

    if (orgOpenWin != null) { 
        orgOpenWin.document.getElementById("orgCd").value = orgCd;
        orgOpenWin.document.getElementById("orgNm").value = orgNm;
        orgOpenWin.document.getElementById("orgDivCd").value = orgDivCd;
        orgOpenWin.document.getElementById("bizNo").value = bizNo;
        orgOpenWin.document.getElementById("ceoNm").value = ceoNm;
        orgOpenWin.document.getElementById("orgTellNo").value = orgTellNo;
        orgOpenWin.document.getElementById("orgFaxNo").value = orgFaxNo;
        orgOpenWin.document.getElementById("orgZip").value = orgZip;
        orgOpenWin.document.getElementById("orgAddr1").value = orgAddr1;
        orgOpenWin.document.getElementById("orgAddr2").value = orgAddr2;
        orgOpenWin.document.getElementById("orgSailNm").value = orgSailNm;
        orgOpenWin.document.getElementById("orgSailPhone").value = orgSailPhone;
    }
}
</script>

</html>