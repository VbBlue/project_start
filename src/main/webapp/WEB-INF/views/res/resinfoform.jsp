<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
	<div class="wrapper row2">
		<section class="hoc container clear">
			<div class="center btmspace-80">
				<h6 class="heading underline font-x2">${buser.username}님 예약이 완료되었습니다.</h6>
					<div id="comments">
						<ul>
							<li>
								<article>
									<header>
										<address>헌혈의 집 정보</address>
									</header>
									<div class="comcont">
									<table>
										<tr>
											<td>헌혈의 집 이름 : </td>
											<td>${bh.bhname} </td>
										</tr>
										<tr>
											<td>헌혈의 집 위치 : </td>
											<td>${bh.bhlocation}</td>
										</tr>
									</table>
									</div>
								</article>
							</li>
						</ul>
					</div>
					<table>
						<tr>
							<td>이름</td>
							<td>${buser.username }</td>
						</tr>
						<tr>
							<td>혈액형</td>
							<td>${buser.userbtype }형</td>
						</tr>
						<tr>
							<td>날짜</td>
							<td>${date}</td>
						</tr>
						<tr>
							<td>시간</td>
							<td>${res.restime}</td>
						</tr>
						<tr>
							<td>기념품</td>
							<td>${res.goods}</td>
						</tr>
						<tr>
							<td>피선택</td>
							<td>${res.bhselect}</td>
						</tr>
					</table>
					<a href="/">확인</a>
			</div>
		</section>
	</div>
	<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<%@ include file="../includes/footer.jsp" %>