<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="">
<!-- To declare your language - read more here: https://www.w3.org/International/questions/qa-html-language-declarations -->
<head>
<title>Gleblu</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
</head>
<body id="top">
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row0">
  <div id="topbar" class="hoc clear">
    <div class="fl_left"> 
      <!-- ################################################################################################ -->
      <ul class="nospace">
        <li><i class="fas fa-phone rgtspace-5"></i> �̹��� �ٲٰ���̵�?</li>
      </ul>
      <!-- ################################################################################################ -->
    </div>
    <div class="fl_right"> 
      <!-- ################################################################################################ -->
      <ul class="nospace">
        <li><a href="/"><i class="fas fa-home"></i></a></li>
        <li><a href="loginform" title="Login"><i class="fas fa-sign-in-alt"></i></a></li>
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
      <h1><a href="/">������ ��</a></h1>
      <!-- ################################################################################################ -->
    </div>
    <nav id="mainav" class="fl_right"> 
      <!-- ################################################################################################ -->
      <ul class="clear">
        <li><a href="/">Home</a></li>   
        <li class="active"><a href="boardform">�Խ���</a></li>
        <li><a href="mapform">����������</a></li>
        <li><a href="mypageform">����������</a></li>
      </ul>
      <!-- ################################################################################################ -->
    </nav>
  </header>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row2">
  <section class="hoc container clear"> 
    <div class="center btmspace-80">
      <h6 class="heading underline font-x2">�� �ۼ�</h6>
     <form method="post">
     <table id="board_table">
     	<thead>
     		<tr>
     			<th>��ȣ</th><td>${dept.boardnum }</td>
     		</tr>
     		<tr>
     			<th>����</th><td>${dept.boardname }</td>
     		</tr>
     		<tr>
     			<th>�ۼ���</th><td>${dept.empid }</td>
     		</tr>
     		<tr>
     			<th>��¥</th><td>${dept.boarddate }</td>
     		</tr>
     		<tr>
     			<th>��ȸ��</th><td>${dept.boardview }</td>
     		</tr>
     		<tr>
     			<th>����</th><td>${dept.inboard }</td>
     		</tr>
     	</thead>
     	<tbody>
     		
     	</tbody>
     </table>
     <hr/>
    	<a href="boardUpdate?no=${dept.boardnum }" role="button" class="btn btn-outline-info">����</a>
     	<a href="boardDelete?no=${dept.boardnum }" role="button" class="btn btn-outline-info">����</a>
     </form>
    </div>
  </section>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row4">
  <footer id="footer" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <div class="one_quarter first">
      <h6 class="heading">2��</h6>
      <ul class="nospace linklist contact btmspace-30">
        <li><i class="fas fa-phone"></i> �� ����?</li>
        <li><i class="far fa-envelope"></i> ���� �̸�?</li>
      </ul>
     
    </div>
    <div class="one_quarter">
      <h6 class="heading">�־ �ǰ� ������ �ǰ�</h6>
      <ul class="nospace linklist">
        <li>
          <article>
            <p class="nospace btmspace-10"><a href="#">???</a></p>
            <time class="block font-xs" datetime="2045-04-06">�ϼ���¥?</time>
          </article>
        </li>
      </ul>
    </div>
    
    
    <!-- ################################################################################################ -->
  </footer>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row5">
  <div id="copyright" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <p class="fl_left">Copyright &copy; 2018 - All Rights Reserved - <a href="#">Domain Name</a></p>
    
    <!-- ################################################################################################ -->
  </div>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<a id="backtotop" href="#top"><i class="fas fa-chevron-up"></i></a>
<!-- JAVASCRIPTS -->
<script src="layout/scripts/jquery.min.js"></script>
<script src="layout/scripts/jquery.backtotop.js"></script>
<script src="layout/scripts/jquery.mobilemenu.js"></script>
</body>
</html>