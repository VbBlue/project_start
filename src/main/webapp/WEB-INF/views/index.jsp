<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./includes/header.jsp" %>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->


<div class="wrapper bgded overlay">
  <div id="pageintro" class="hoc clear" >
    <!-- ################################################################################################ -->
    <article>
	
<!-- 불릿 클릭에 따라 체크된 라디오박스가 변하도록 "radio"가 3개 정의되고,
	그 뒤에 슬라이드 이미지 3장을 목록(<ul>)으로 정의한다.
	마지막에는 슬라이드 이동을 위해 클릭하는 슬라이드 불릿이 3개 오게 된다.
	양식을 만들 때는 일반적으로 라디오박스 태그 위에 라벨이 각각 오게 되지만,
	레이아웃을 편리하게 만들기 위해 라벨 태그들만을 따로 모아서 맨 뒤에 배치 -->
	
	
	<div class="slider">
		<input type="radio" name="slide" id="slide1" checked>
	    <input type="radio" name="slide" id="slide2">
	    <input type="radio" name="slide" id="slide3">
	    <input type="radio" name="slide" id="slide4">
	    <input type="radio" name="slide" id="slide5">

    <ul id="imgholder" class="imgs">
	    <li><img src="images/43944462-9380-491E-BB0B-3125A4301B96.jpeg"></li>
	    <li><img src="images/496EF8B0-4083-44CB-A86D-9F0C57AD03E1.jpeg"></li>
	    <li><img src="images/887A235F-20EC-4CA6-9006-D8309BFF2EE3.jpeg"></li>
	    <li><img src="images/CAC686C6-4C1C-483E-8721-E58A8C622DEA.jpeg"></li>
	    <li><img src="images/FDACFE0C-72D0-412C-A30C-EF0D846630D0.jpeg"></li>
    </ul>


    <div class="bullets">
        <label for="slide1">&nbsp;</label>
        <label for="slide2">&nbsp;</label>
        <label for="slide3">&nbsp;</label>
        <label for="slide4">&nbsp;</label>
         <label for="slide5">&nbsp;</label>
    </div>

</div>



      <footer>
        <ul class="nospace inline pushright">

        </ul>





      <h3 class="heading">헌혈의 집</h3>


      </footer>

    </article>
    <!-- ################################################################################################ -->
  </div>
</div>



<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->

<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<%@ include file="./includes/footer.jsp" %>
