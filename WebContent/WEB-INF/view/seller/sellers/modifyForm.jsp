<%
/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF HIMEDIA.CO.KR.
 * HIMEDIA.CO.KR OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 HIMEDIA.CO.KR ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 himedia.co.kr에 있으며,
 * himedia.co.kr이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * himedia.co.kr의 지적재산권 침해에 해당된다.
 * Copyright (C) 2024 himedia.co.kr All Rights Reserved.
 *
 *
 * Program		: kr.co.challengefarm
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			:
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20240626130000][dhtjgml87@himedia.co.kr][CREATE: Initial Release][TODO: 정보수정 클릭시 비밀번호 확인 후 정보 변경 가능하도록]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/member/modifyForm.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/common/header.jsp" %>
	<style>
		.join {width:450px;margin:50px auto 100px;padding:30px 20px;text-align:center;}
		.join h3 {margin:0 0 50px;}
		
		.joinArea {text-align:left;}
		
		input {font-size:15px;}
		input[type=text], input[type=password] {width:100%;padding-left:5px;}
		label {width:100%;margin:10px 0 3px;}
		#email {width:calc(100% - 84px);}
		#phone1 {width:50px;}
		#phone2, #phone3 {width:70px;}
		#post {width:60px;}
		#addr1 {margin:5px 0;}
		
		.joinArea > div >input {display:block;width:300px;height:50px;margin:30px auto 0;line-height:50px;background:#007bff;color:white;border-radius:10px;border:none;}
	</style>
	<script>
		window.onload = function () {
		
		
	</script>
</head>
<body>
	<header class="header">
		<%@ include file="/include/common/top.jsp" %>
	</header>
	
	<section class="content">
		<nav></nav>
		<article class="join">
			<h3>회원가입</h3>
			<form id="frmMain" name="frmMain" method="POST">
				<div class="joinArea">
					<ul>
						<li>
							<label for="">이메일(아이디*)</label>
							<input type="text" id="email" name="email" required placeholder="eample@chall.com" />
							<input type="button" value="중복 찾기" id="btnId" />
						</li>
						<li>
							<label for="">비밀번호(*)</label>
							<input type="password" id="passwd" name="passwd" required placeholder="※특수문자 포함 8자리 이상" />
						</li>
						<li>
							<label for="">비밀번호 확인(*)</label>
							<input type="password" id="passwd_" name="passwd_" required />
						</li>
						<li>
							<label for="">성명(*)</label>
							<input type="text" id="mbr_nm" name="mbr_nm" required />
							<input type="radio" name="gender" value="M" checked /> 남
							<input type="radio" name="gender" value="F" /> 여
							
						</li>
						<li>
							<label for="">연락처(*)</label>
							<input   type="text" id="phone1" name="phone1" maxlength="3" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
							- <input type="text" id="phone2" name="phone2" maxlength="4" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
							- <input type="text" id="phone3" name="phone3" maxlength="4" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
							
						</li>
						<li>
							<label for="">우편번호(*)</label>
							<input value="12345" type="text" maxlength="5" id="post" name="post" required readonly />
							<input type="button" value="우편번호 찾기" onClick="execDaumPostcode();" /><br />
							<input type="text" size="40" required id="addr1" name="addr1" readonly placeholder="도로명 주소" />
							<input type="hidden" id="jibunAdd" />
							<input type="hidden" id="exliaAddress" />
							<span id="guide" style="color:#999; display:none"></span>
							<input type="text" placeholder="상세 주소" required id="addr2" name="addr2" />
						</li>
						<li style="margin-top:30px;">
							<label for="" style="width:auto;margin-right:30px;">마케팅 수신 동의</label>
							SMS <input type="checkbox" name="flg_sms" value="Y" />
							Email <input type="checkbox" name="flg_email" value="Y" />
						</li>
					</ul>
					<div>
						<input type="button" value="가입 하기" style="width:100px" onClick="checkRegister();"/>
					</div>
				</div>
			</form>
		</article>
		<aside></aside>
	</section>
	
	<%@ include file="/include/common/footer.jsp" %>
	
	<!-- Search Begin -->
	<div class="search-model">
		<div class="h-100 d-flex align-items-center justify-content-center">
			<div class="search-close-switch">+</div>
			<form class="search-model-form">
				<input type="text" id="search-input" placeholder="Search here.....">
			</form>
		</div>
	</div>
	<!-- Search End -->
</body>
</html>