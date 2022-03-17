<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
	<div class="wrapper row2">
		<section class="hoc container clear">
			<div class="center btmspace-80">
				<h6 class="heading underline font-x2">예약 완료</h6>
					<div id="comments" style="width: 100%;">
						<ul>
							<li>
								<article>
									<header>
										<address>헌혈의 집 정보</address>
									</header>
									<div class="res_bh_info_main" >
										<div class="res_bh_in">
											<div class="res_num">헌혈의 집 이름  </div>
											<input type="text" value="${bh.bhname}" name="bhname" id="bhname" readonly="readonly" class="bh_info">
										</div>
										<div class="res_bh_in">
											<div class="res_num">헌혈의 집 위치  </div>
											<input type="text" value=" ${bh.bhlocation}" name="bhlocation" id="bhlocation" readonly="readonly" class="bh_info">
										</div>
									</div>
								</article>
							</li>
						</ul>
					</div>
					<div id="resinfo_bottom">
						<div style="margin-bottom: 20px;">
							<h3 class="heading underline font-xs">예약 정보</h3>
						</div>
						<div id="resinfo_bottom_two">
							<div class="res_bottom">
								<div class="res_bot">
									<div class="res_bot_title">
										이름
									</div>
									<div class="res_bot_con">
										<input value="${buser.username }">
									</div>
								</div>
								<div class="res_bot">
									<div class="res_bot_title">
										혈액형
									</div>
									<div class="res_bot_con">
										<input value="${buser.userbtype }형">
									</div>
								</div>
								<div class="res_bot">
									<div class="res_bot_title">
										날짜
									</div>
									<div class="res_bot_con">
										<input value="${date}">
									</div>
								</div>
								<div class="res_bot">
									<div class="res_bot_title">
										시간
									</div>
									<div class="res_bot_con">
										<input value="${res.restime}">
									</div>
								</div>
								<div class="res_bot">
									<div class="res_bot_title">
										기념품
									</div>
									<div class="res_bot_con">
										<input value="${res.goods}">
									</div>
								</div>
								<div class="res_bot">
									<div class="res_bot_title">
										피선택
									</div>
									<div class="res_bot_con">
										<input value="${res.bhselect}">
									</div>
								</div>
							</div>
						</div>
					</div>
				<a href="/">확인</a>
			</div>
		</section>
	</div>
<%@ include file="../includes/footer.jsp" %>
