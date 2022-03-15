<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="layout/styles/mypage.css" rel="stylesheet" type="text/css" media="all">
	      <div>
	      <nav class="menu">
	      	<h1><button id="mypage">마이페이지</button></h1>
		      <ul class="menu_list">
		      	<li><input type='button' value='개인정보변경' id='mem_update'></li>
		      	<li><input type='button' value='헌혈내역' id='bloodlist'></li>
		      	<li><input type='button' value='당첨내역' id='goodslist'></li>
		      	<li><input type='button' value='회원탈퇴' id='mem_delete'></li>
		      </ul>
		  </nav>
	      </div>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function() {
		$('#mypage').click(function() {
			location.href="/mypageform";
		});
		$('#mem_update').click(function() {
			window.open("/pass_chk", "mem_update", "width=400px, height=400px");
		});//개인정보변경 클릭
		$('#mem_delete').click(function() {
			window.open("/pass_chk", "mem_delete", "width=400px, height=400px");
		});//회원탈퇴 클릭
		$('#bloodlist').click(function() {
			location.href="/bloodlist";
		});//헌혈내역 클릭
		$('#goodslist').click(function() {
			location.href="/goodslist";
		});//당첨내역 클릭
	});
	
</script>