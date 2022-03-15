<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">


<div class="wrapper row2">
  <section class="hoc container clear">
    <div class="center btmspace-80">
      <h6 class="heading underline font-x2" id="h6_login">비밀번호 찾기</h6>



	<form name="pwsearch" method="post">
	<c:if test="${findpw != null}">

	<div class = "container">
	<div class = "found-success">
	<h4 id="h6_login"> 비밀번호를 이메일로 전송했습니다. </h4>


	<div class = "found-id">  </div>
	</div>
	<div class="found-login">
		<div class="button2">
		<input type="button" id="login" value="로그인" onclick="location.href='loginform'"></div>
	</div>
	</div>

	</c:if>




	<c:if test="${findpw == null}">
		<div class="container">
			<div class="found-fail">
				<h4 id="h6_login"> 입력한 정보를 다시 확인해주세요. </h4>
			</div>






			<div class="found-login">

		<div class="button2">
	    <input type="button" id="btnback" value="다시 찾기" onclick="history.back()" /></div>


		<div class="button2">
		<input type="button" id="login" value="로그인" onclick="location.href='signup'"></div>




			</div>
		</div>

	</c:if>
	</form>

</div>

</section>
</div>
<%@ include file="../includes/footer.jsp" %>
