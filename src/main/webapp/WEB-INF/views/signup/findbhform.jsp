<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
<script src="layout/scripts/jquery.min.js"></script>
<script src="layout/scripts/jquery.backtotop.js"></script>
<script src="layout/scripts/jquery.mobilemenu.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	function bh_send_close(mybhname){
		opener.document.getElementById("bhname").value = mybhname;
		window.close();
	}
</script>
</head>
<body>
	<c:if test="${count != 0}">
				<table>
					<tr>
						<th>헌혈의집</th>
						<th>주소</th>
						<th>전화번호</th>
						<th>혈액원</th>
					</tr>
					<c:forEach items="${bh_page_list}" var="bh">
						<tr>
							<td><input type="button" id="${bh.bhname}" value="${bh.bhname}" onclick="bh_send_close(this.value)"></td>
							<td>${bh.bhlocation}</td>
							<td>${bh.bhphone}</td>
							<td>${bh.bhone}</td>
						</tr>
					</c:forEach>
				</table>
				<div id="page">
					<c:if test="${begin > pageNum}">
						<a href="findbhform?p=${begin-1}">[이전]</a>
					</c:if>
					<c:forEach begin="${begin}" end="${end}" var="i">
						<a href="findbhform?p=${i}">${i}</a>
					</c:forEach>
					<c:if test="${end < totalpages}">
						<a href="findbhform?p=${end+1}">[다음]</a>
					</c:if>
				</div>
			</c:if>
			<c:if test="${count == 0}">
			</c:if>
</body>
</html>