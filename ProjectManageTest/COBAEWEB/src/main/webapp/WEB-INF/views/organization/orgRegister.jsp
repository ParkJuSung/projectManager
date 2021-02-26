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
    <title>Focusleader Project Manager 기관 등록</title>

</head>
<body class="bg-primary">
<div id="layoutAuthentication_content">
    <main>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-7">
                    <div class="card shadow-lg border-0 rounded-lg mt-5">
                        <div class="card-header"><h3 class="text-center font-weight-light my-4">기관 등록</h3>
                        </div>
                        <div class="card-body">
                            <form action="${pageContext.request.contextPath}/organization/orgRegister" method="post">

                           <div class="form-group">
                            	<label class="small mb-1" for="orgCd"> 기관코드 </label>
                                   <input class="form-control py-4" id="orgCd" name="orgCd" type="text"
                                           placeholder="기관코드 입력"/>
                            </div>
                            
                            <div class="form-group">
                            	<label class="small mb-1" for="orgNm"> 기관명 </label>
                                   <input class="form-control py-4" id="orgNm" name="orgNm" type="text"
                                           placeholder="기관명 입력"/>
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
                                
                                <div class="form-group">
                                    <label class="small mb-1" for="bizNo">사업자 번호</label>
                                    <input class="form-control py-4" id="bizNo" name="bizNo" type="text"
                                     placeholder="사업자번호 입력"/>
                                </div>
                                
                                <div class="form-group">
                                    <label class="small mb-1" for="ceoNm">대표자명</label>
                                    <input class="form-control py-4" id="ceoNm" name="ceoNm" type="text"/
                                     placeholder="대표자명 입력">
                                </div>
                                
                                
                                <div class="form-group">
                                    <label class="small mb-1" for="orgTellNo">기관대표전화</label>
                                    <input class="form-control py-4" id="orgTellNo" name="orgTellNo" type="text"
                                           placeholder="기관대표전화 번호 입력"/>
                                </div>
                                
                                <div class="form-group">
                                    <label class="small mb-1" for="orgFaxNo">기관팩스번호</label>
                                    <input class="form-control py-4" id="orgFaxNo" name="orgFaxNo" type="text"
                                           placeholder="기관팩스번호 입력"/>
                                </div>
                                
                                <div class="form-group">
                                    <label class="small mb-1" for="orgZip">우편번호</label>
                                    <input class="form-control py-4" id="orgZip" name="orgZip" type="text"
                                     placeholder="기관 우편번호 입력"/>
                                </div>
                                
								<div class="form-group">
                                    <label class="small mb-1" for="orgAddr1">기관주소1</label>
                                    <input class="form-control py-4" id="orgAddr1" name="orgAddr1" type="text"
                                     placeholder="기관주소 입력"/>
                                </div>
                                
                                <div class="form-group">
                                    <label class="small mb-1" for="orgAddr2">기관주소2</label>
                                    <input class="form-control py-4" id="orgAddr2" name="orgAddr2" type="text"]
                                     placeholder="기관주소2 입력"/>
                                </div>
                                
                                <div class="form-group">
                                    <label class="small mb-1" for="orgSailNm">영업대표명</label>
                                    <input class="form-control py-4" id="orgSailNm" name="orgSailNm" type="text"
                                     placeholder="영업대표명 입력"/>
                                </div>
                                
                                <div class="form-group">
                                    <label class="small mb-1" for="orgSailPhone">영업대표명전화번호</label>
                                    <input class="form-control py-4" id="orgSailPhone" name="orgSailPhone" type="text"
                                     placeholder="영업대표명전화번호 입력"/>
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