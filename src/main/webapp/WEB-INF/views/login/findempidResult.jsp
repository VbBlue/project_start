<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp" %>
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">

<div class="wrapper row2">
  <section class="hoc container clear">
    <div class="center btmspace-80">
      <h6 class="heading underline font-x2" id="h6_login">아이디 찾기</h6>


	<form name="idsearch" method="post">
	<c:if test="${findempid != null}">

	<div class = "container">
	<div class = "found-success">
	<h4 id="h6_login"> ${findempid.empid} 입니다.  </h4>



	<div class = "found-id">  </div>
	</div>
	<div class="found-login">

<div class="button2">
		<input type="button" id="login" value="로그인" onclick="location.href='emploginform'"></div>

	</div>
	</div>

	</c:if>




	<c:if test="${findempid == null}">
		<div class="container">

			<div class="found-fail">
				<h4 id="h6_login">등록된 정보가 없습니다</h4></div>


			<div class="found-login">


		<div class="button2">
	    <input type="button" id="btnback" value="다시 찾기" onclick="history.back()" /></div>


		<div class="button2">
		<input type="button" id="joinform" value="회원가입" onclick="location.href='signup'"></div>


			</div>
		</div>

	</c:if>
	</form>

</div>

</section>
</div>
<%@ include file="../includes/footer.jsp" %>
