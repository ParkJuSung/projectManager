<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/resources/plugin/plugin.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugin/js/backspace.js"></script>
<%@ include file="/resources/plugin/plugin.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Focusleader Project Manager 프로세스 등록</title>

</head>
<body class="bg-primary">
<div id="layoutAuthentication_content">
    <main>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-7">
                    <div class="card shadow-lg border-0 rounded-lg mt-5">
                        <div class="card-header"><h3 class="text-center font-weight-light my-4">프로세스 수정</h3>
                        </div>
                        <div class="card-body">
                            <form action="${pageContext.request.contextPath}/process/procEdit" method="post">

							<div class="form-group">
                            	<label class="small mb-1" for="pjtSeq"> 프로젝트일련번호 </label>
                                   <input class="form-control py-4" id="pjtSeq" name="pjtSeq" type="text"/>
                            </div>
                            
                           <div class="form-group">
                            	<label class="small mb-1" for="procCd"> 프로세스코드 </label>
                                   <input class="form-control py-4" id="procCd" name="procCd" type="text"
                                           placeholder="프로세스코드 입력"/>
                            </div>
                                                                
                            <div class="form-row">
                             	<div class="col-md-6">
                                	<div class="form-group">
                                     	<label class="small mb-1" for="preStrDay">프로세스 예상 시작일</label>
                                         <input class="form-control py" type='date' id='preStrDay' name="preStrDay">
                                     </div>
                                </div>
                                 <div class="col-md-6">
                                      <div class="form-group">
                                          <label class="small mb-1" for="preEndDay">프로세스 예상 종료일</label>
                                           <input class="form-control py" type='date' id='preEndDay'
                                                       name="preEndDay">
                                       </div>
                                 </div>
							</div>
							
							<div class="form-row">
                             	<div class="col-md-6">
                                	<div class="form-group">
                                     	<label class="small mb-1" for="relStrDay">프로세스 실제 시작일</label>
                                         <input class="form-control py" type='date' id='relStrDay' name="relStrDay">
                                     </div>
                                </div>
                                 <div class="col-md-6">
                                      <div class="form-group">
                                          <label class="small mb-1" for="relEndDay">프로세스 실제 종료일</label>
                                           <input class="form-control py" type='date' id='relEndDay'
                                                       name="relEndDay">
                                       </div>
                                 </div>
							</div>      
							                                
							<div class="form-group">
                                 <label class="small mb-1" for="currYn">진행여부</label>
                                  <select class="form-control py" id="currYn" name="currYn"
                                          style="width:130px;text-align-last:center">
                                  		<option value="none">= 선택 =</option>
                                         <option value="1">Y</option>
                                         <option value="0">N</option>
                                  </select>
                            </div>
							
							<div class="form-group">
                                 <label class="small mb-1" for="statCd">진행코드</label>
                                  <select class="form-control py" id="statCd" name="statCd"
                                          style="width:130px;text-align-last:center">
                                  		<option value="none">= 선택 =</option>
                                         <option value="01">진행</option>
                                         <option value="02">보류</option>
                                         <option value="03">중지</option>
                                  </select>
                            </div>
                            
                                  <div class="form-group">
                                      <label class="small mb-1" for="reamark">비고</label>
                                       <input class="form-control py" type='text' id='reamark' name="reamark">
                                  </div>

                                <div class="form-group">
                                    <label class="small mb-1" for="orgDivCd">기관구분</label>
                                  		<select class="form-control py" id="orgDivCd" name="orgDivCd"
                                               style="width:130px;text-align-last:center">
                                            <option value="none">= 선택 =</option>
                                            <option value="01">은행</option>
                                            <option value="02">정부기관</option>
                                            <option value="03">공기업</option>
                                            <option value="04">일반기업</option>
                                        </select>
                                </div>

                                    <div style="text-align:center;">
                                        <div>
                                            <button type="submit" class="btn btn-primary">등록</button>
                                        </div>
                                    </div>       
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>

<script>

function updateClose(){
//	setTimeout(function () {
		//	opener.parent.selectData();
//	},500)
}

</script>
</body>
</html>