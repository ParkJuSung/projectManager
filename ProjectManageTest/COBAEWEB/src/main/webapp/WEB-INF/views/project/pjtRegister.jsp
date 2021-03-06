<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugin/js/backspace.js"></script>
<%@ include file="/resources/plugin/plugin.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Focusleader Project Manager</title>
</head>
<body class="bg-primary">

<div id="layoutAuthentication">
    <div id="layoutAuthentication_content">
        <main>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-7">
                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                            <div class="card-header">
                                <h3 class="text-center font-weight-light my-4">프로젝트 등록</h3>
                            </div>
                            <div class="card-body">
                                <form action="${pageContext.request.contextPath}/project/pjtRegister" method="post">
                                
                                    <div class="form-group">
                                        <label class="small mb-1" for="pjtCd">프로젝트코드</label>
                                        <input class="form-control py-4" id="pjtCd" name="pjtCd" type="text"
                                               placeholder="프로젝트코드 입력"/>
                                    </div>
                                    
                                    <div class=form-group">
                                        <label class="small mb-1" for="pjtNm">프로젝트 명</label> <input
                                            class="form-control py-4" id="pjtNm" name="pjtNm" type="text"
                                            placeholder="프로젝트 명 입력"/>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="small mb-1" for="orgSeq">기관명</label>
                                        <select class="form-control py" id="orgSeq" name="orgSeq"
                                                style="width:130px;text-align-last:center">
                                            <option value="none">=== 선택 ===</option>
                                            <option value="0001">포커스리더(본사)</option>
                                            <option value="0002">새마을금고</option>
                                            <option value="0003">신협</option>
                                        </select>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="small mb-1" for="pjtStatCd">프로젝트상태</label>
                                        <select class="form-control py" id="pjtStatCd" name="pjtStatCd"
                                                style="width:130px;text-align-last:center">
                                            <option value="none">=== 선택 ===</option>
                                            <option value="EPM00901">진행</option>
                                            <option value="EPM00902">보류</option>
                                            <option value="EPM00903">중지</option>
                                        </select>
                                    </div>
                                    
                                    <div class="form-row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="small mb-1" for="preStrDay">프로젝트 예상 시작일</label>
                                                <input class="form-control py" type='date' id='preStrDay'
                                                       name="preStrDay">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="small mb-1" for="preEndDay">프로젝트 예상 종료일</label>
                                                <input class="form-control py" type='date' id='preEndDay'
                                                       name="preEndDay">
                                            </div>
                                        </div>
									</div>
									
                                    <div style="text-align:center;">
                                        	<button type="submit" class="btn btn-primary" id="pjtRegister">등록</button>
                                    </div>

                                </form>
                            </div>

                        </div>
                        <br/>
                        <br/>
                    </div>
                </div>
            </div>
        </main>
    </div>
    <div id="layoutAuthentication_footer">
        <footer class="py-4 bg-light mt-auto">
            <div class="container-fluid">
                <div
                        class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted">Copyright &copy; Your Website 2020</div>
                    <div>
                        <a href="#">Privacy Policy</a> &middot; <a href="#">Terms
                        &amp; Conditions</a>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</div>


<%--<script>--%>
<%--    var msg = "${Message}";--%>
<%--    --%>
<%--    if (msg === "PJT register success") {--%>
<%--        alert("프로젝트 등록이 완료되었습니다.")--%>
<%--    } else {--%>
<%--        alert("등록실패.")--%>
<%--    }--%>
<%--</script>--%>

<script>
    document.getElementById('preStrDay').value = new Date().toISOString().substring(0, 10);
    document.getElementById('preEndDay').value = new Date().toISOString().substring(0, 10);

</script>

</body>
</html>
