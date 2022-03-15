<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="">
<!-- To declare your language - read more here: https://www.w3.org/International/questions/qa-html-language-declarations -->
<head>

<title>헌혈의 집</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
<script src="layout/scripts/jquery.min.js"></script>
<script src="layout/scripts/jquery.backtotop.js"></script>
<script src="layout/scripts/jquery.mobilemenu.js"></script>

</head>
<body id="top">
<div class="wrapper row0">
  <div id="topbar" class="hoc clear">
    <div class="fl_right">
      <!-- ################################################################################################ -->
      <ul class="nospace">
        <li><i class="fas fa-user rgtspace-5"></i>
        <c:if test="${user.userid != null && emp.empid == null}">
					${user.userid} 님이 로그인 하였습니다
		</c:if>

		 <c:if test="${user.userid == null && emp.empid == null}">
					로그인 후 이용해주세요
		</c:if>
		 <c:if test="${user.userid == null && emp.empid != null}">
					${emp.empid} 님이 로그인 하였습니다
		</c:if>



		</li>
      </ul>
      <!-- ################################################################################################ -->
    </div>
    <div class="fl_right">
      <!-- ################################################################################################ -->
      <ul class="nospace">







      </ul>
      <!-- ################################################################################################ -->
    </div>
  </div>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row1">
  <header id="header" class="hoc clear">
    <div id="logo" class="fl_left">


    <img src="images/1008104646.jpeg" style=" margin-bottom:15px; height:40px; width:40px;">
      <c:if test="${emp.empid == null}">
      	<a id="logoname" href="/">헌혈해주세요</a>
      </c:if>
      <c:if test="${emp.empid != null}">
      	<a id="logoname" href="emppage">헌혈해주세요</a>
      </c:if>
      <!-- ################################################################################################ -->
    </div>
    <nav id="mainav" class="fl_right">
      <!-- ################################################################################################ -->
      <ul class="clear">
      <c:if test="${emp.empid == null}">
      	<li><a>회원가입</a>
      	<ul>
      		<li><a href="/usersignupform" title="signup">회원 회원가입</a>
      		<li><a href="/empsignupform" title="empsingup">관리자<br>회원가입</a>
      	</ul>
      	</li>
		</c:if>
		<c:if test="${emp.empid != null}">
			<li><a href="emppage">관리자 페이지</a></li>
		</c:if>
        <li><a href="boardform">게시판</a></li>
      <c:if test="${emp.empid == null}">
        <li><a href="mapform">예약페이지</a></li>
        <li><a href="mypageform">마이페이지</a></li>
		</c:if>



		<c:if test="${user.userid != null && emp.empid==null}">
        <li><a href="logout" title="Logout">회원 로그아웃</a></li>
        </c:if>
        <c:if test="${emp.empid != null && user.userid ==null}">
        <li><a href="emplogout" title="empLogout">관리자 로그아웃</a></li>
        </c:if>




        <c:if test="${user.userid == null && emp.empid==null}">
        <li><a>로그인</a>
        <ul>
	        <li><a href="loginform" title="Login">회원 로그인</a></li>
			<li><a href="emploginform" title="emplogin">관리자 로그인</a></li>
        </ul>
        </li>
		</c:if>

		<!--  사용자 로그아웃 -->


<!-- 관리자 로그아웃 -->









      </ul>
      <!-- ################################################################################################ -->
    </nav>
  </header>
</div>
</body>