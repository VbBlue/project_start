<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp" %>


<div class="wrapper row2">
  <section class="hoc container clear">
    <div class="center btmspace-80">
      <h6 class="heading underline font-x2">아이디 찾기</h6>


	<form name="idsearch" method="post">
	<c:if test="${findid != null}">

	<div class = "container">
	<div class = "found-success">
	<h4> 회원님의 정보는 ${findid.userid} 입니다.  </h4>



	<div class = "found-id">  </div>
	</div>
	<div class="found-login">
	<!-- <input type="button" id="btnlogin" value="로그인" onclick="/"> -->
	<a href="/login">로그인</a>

	</div>
	</div>

	</c:if>




	<c:if test="${findid == null}">
		<div class="container">
			<div class="found-fail">
				<h4>등록된 정보가 없습니다</h4>
			</div>
			<div class="found-login">

				<input type="button" id="btnback" value="다시 찾기" onclick="history.back()" />
		   <!-- <input type="button" id="btnjoin" value="회원 가입" onclick="signup"> -->

				<a href="/signup">회원가입</a>

			</div>
		</div>

	</c:if>
	</form>

</div>

</section>
</div>

<%@ include file="../includes/footer.jsp" %>