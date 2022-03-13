<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp" %>



<div class="wrapper row2">
  <section class="hoc container clear">
    <div class="center btmspace-80">
      <h6 class="heading underline font-x2">비밀번호 찾기</h6>



	<form name="pwsearch" method="post">
	<c:if test="${findpw != null}">

	<div class = "container">
	<div class = "found-success">
	<h4> 비밀번호를 이메일로 전송했습니다. </h4>


	<div class = "found-id">  </div>
	</div>
	<div class="found-login">
	<a href="/loginform">로그인</a>
	</div>
	</div>

	</c:if>




	<c:if test="${findpw == null}">
		<div class="container">
			<div class="found-fail">
				<h4> 입력한 정보를 다시 확인해주세요. </h4>
			</div>

			<div class="found-login">
				<input type="button" id="btnback" value="다시 찾기" onclick="history.back()" />
				<a href="login">로그인</a>
			</div>
		</div>

	</c:if>
	</form>

</div>

</section>
</div>

<%@ include file="../includes/footer.jsp" %>