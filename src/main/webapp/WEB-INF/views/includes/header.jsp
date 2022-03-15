<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="">
<!-- To declare your language - read more here: https://www.w3.org/International/questions/qa-html-language-declarations -->
<head>
<title>Gleblu</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/layout1.css" rel="stylesheet" type="text/css" media="all">
<script src="layout/scripts/jquery.min.js"></script>
<script src="layout/scripts/jquery.backtotop.js"></script>
<script src="layout/scripts/jquery.mobilemenu.js"></script>
</head>
<body id="top">
<div class="wrapper row0">
  <div id="topbar" class="hoc clear">
    <div class="fl_left">
      <!-- ################################################################################################ -->
      <ul class="nospace">
        <li><i class="fas fa-phone rgtspace-5"></i></li>
        <c:if test="${user.userid != null}">
					<p>${user.userid}님이 로그인 하였습니다 ^___^ </p>
					</c:if>
		 <c:if test="${user.userid == null}">
					<p>로그인 하지 않았습니다. </p>
					</c:if>
      </ul>
      <!-- ################################################################################################ -->
    </div>
    <div class="fl_right">
      <!-- ################################################################################################ -->
      <ul class="nospace">
        <li><a href="/"><i class="fas fa-home"></i></a></li>
        <c:if test="${user.userid == null}">
        <li><a href="loginform" title="Login"><i class="fas fa-sign-in-alt"></i></a></li>
		</c:if>
		<c:if test="${user.userid != null}">
        <li><a href="logout" title="Logout"><i class="fas fa-sign-in-alt"></i></a></li>
        </c:if>
        <li><a href="signupform" title="Sign Up"><i class="fas fa-edit"></i></a></li>
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
      <!-- ################################################################################################ -->
      <h1><a href="/">헌혈의 집</a></h1>
      <!-- ################################################################################################ -->
    </div>
    <nav id="mainav" class="fl_right">
      <!-- ################################################################################################ -->
      <ul class="clear">
        <li class="active"><a href="/">Home</a></li>
        <li><a href="boardform">게시판</a></li>
        <li><a href="mapform">예약페이지</a></li>
        <li><a href="mypageform">마이페이지</a></li>
      </ul>
      <!-- ################################################################################################ -->
    </nav>
  </header>
</div>
</body>