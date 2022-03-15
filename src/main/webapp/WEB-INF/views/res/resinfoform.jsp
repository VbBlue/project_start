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
					<div>
						<div>
						<h3 class="heading underline font-xs">예약 정보</h3>
						</div>
							<div>
							이름
							${buser.username }
							</div>
							<div>
							혈액형
							${buser.userbtype }형
							</div>
							<div>
							날짜
							${date}
							</div>
							<div>
							시간
							${res.restime}
							</div>
							<div>
							기념품
							${res.goods}
							</div>
							<div>
							피선택
							${res.bhselect}
							</div>
					</div>
					<a href="/">확인</a>
			</div>
		</section>
	</div>
<%@ include file="../includes/footer.jsp" %>
