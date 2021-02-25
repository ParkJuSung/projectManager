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
    <title>Focusleader Project Manager 직원정보</title>

</head>
<body class="bg-primary">
<div id="layoutAuthentication_content">
    <main>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-7">
                    <div class="card shadow-lg border-0 rounded-lg mt-5">
                        <div class="card-header"><h3 class="text-center font-weight-light my-4">수정</h3>
                        </div>
                        <div class="card-body">
                            <form action="${pageContext.request.contextPath}/user/empEdit" method="post">
                            
                            <div class="form-group">
                            	<label class="small mb-1" for="OrgSeq"> 기관 </label>
                            	  <select class="form-control py" id="orgSeq" name="OrgSeq" style="width:130px;text-align-last:center">
                                        <option value="none">= 선택 =</option>
                                        <option value="1">본사</option>
                                  </select>
                            </div>
                           
                                <div class="form-group">
                                    <label class="small mb-1" for="empNm">이름</label>
                                    <input class="form-control py-4" id="empNm" name="empNm" type="text"
                                           placeholder="이름 입력"/>
                                </div>
                                
                                <div class="form-group">
                                    <label class="small mb-1" for="empId">사원(Id) 번호</label>
                                    <input class="form-control py-4" id="empId" name="empId" type="text" readonly />
                                </div>
                                
                                <div class="form-group">
                                    <label class="small mb-1" for="empEmail">이메일</label>
                                    <input type="email" id="empEmail" name="empEmail" class="form-control py-4" readonly/>
                                </div>
                                
                                
                                <div class="form-group">
                                    <label class="small mb-1" for="empPhoneNo">휴대전화 번호</label>
                                    <input class="form-control py-4" id="empPhoneNo" name="empPhoneNo" type="text"
                                           placeholder="휴대전화 번호 입력"/>
                                </div>
                                
                                <div class="form-group">
                                    <label class="small mb-1" for="emerNo">비상연락처</label>
                                    <input class="form-control py-4" id="emerNo" name="emerNo" type="text"
                                           placeholder="비상연락처 입력"/>
                                </div>
                                <div class="form-group">
                                    <label class="small mb-1" for="empJoinDay">입사일</label>
                                    <input class="form-control py-4" id="empJoinDay" name="empJoinDay" type="date" readonly/>
                                </div>
                                
                                <div class="form-group">
                                        <label class="small mb-1" for="skillLvCd">기술등급</label>
                                        <br/>
                                        <select class="form-control py" id="skillLvCd" name="skillLvCd"
                                                style="width:130px;text-align-last:center">
                                            <option value="none">= 선택 =</option>
                                            <option value="A01">초급</option>
                                            <option value="A02">중하</option>
                                            <option value="A12">중급</option>
                                            <option value="A22">중상</option>
                                            <option value="A03">고급</option>
                                            <option value="A04">특급</option>
                                        </select>

                                </div>
                                
                                <div class="form-group">
                                    <label class="small mb-1" for="empDivCd"> 직원구분 </label>
                            	  	<select class="form-control py" id="empDivCd" name="empDivCd" style="width:130px;text-align-last:center">
	                                    <option value="none">= 선택 =</option>
	                                    <option value="1">정규직</option>
	                                    <option value="2">계약직</option>
	                                </select>
                            	</div>
                            
                                <div class="form-group">
                                    <label class="small mb-1" for="posCd">직위</label>
                                    <select class="form-control py" id="posCd" name="posCd"
                                            style="width:130px;text-align-last:center">
                                        <option value="none">= 선택 =</option>
                                        <option value="A001">사원</option>
                                        <option value="A002">주임</option>
                                        <option value="A003">대리</option>
                                        <option value="A004">과장</option>
                                        <option value="A005">차장</option>
                                        <option value="A006">부장</option>
                                        <option value="A007">이사</option>
                                        <option value="A008">상무</option>
                                        <option value="A009">전무</option>
                                        <option value="A010">대표이사</option>
                                    </select>
								</div>
								
								<div class="form-group">
									<label class="small mb-1" for="statCd">상태</label>
									<select class="form-control py" id="statCd" name="statCd"
										style="width:130px;text-align-last:center">
										<option value="none">= 선택 =</option>
										<option value=01>재직</option>
										<option value=02>퇴직</option>
										<option value=03>출장</option>
										<option value=04>휴가</option>
									</select>
								</div>
								
                                    <div style="text-align:center;">
                                        <div>
                                            <button type="submit" class="btn btn-primary">수정</button>
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