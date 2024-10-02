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
 *				: [20240626130000][dhtjgml87@himedia.co.kr][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/login/loginForm.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/front/header.jsp" %>
	<style>
		.login {width:450px;margin:50px auto 100px;padding:30px 20px;text-align:center;}
		.login h3 {margin:0 0 50px;}
		
		.tab {display:flex;margin-bottom:40px;}
		.tab li {width:50%;cursor:pointer;padding-bottom:10px;box-sizing:border-box;}
		.tab li.active {border-bottom:2px solid black;font-weight:bold;}
		
		.loginArea {display:flex;justify-content:space-between;}
		.loginArea li input {width:250px;height:50px;}
		.loginArea li:nth-child(1) {margin-bottom:15px;}
		.loginArea > input {width:100px;color:white;background:black;border:none;}
		
		.login > div {display:flex;justify-content:space-between;}
		.login > div a {color:gray;}
		.login > div a:hover {color:#007bff;}
		
		.mbr {display:block;}
		.sll {display:none;}
		
		.saveID {margin:20px 0 40px;text-align:left;}
	</style>
	<script>
		window.onload = function () {
			if ("${url}") {
				alert("로그인이 필요합니다.");
			}
		}
		
		function checkForm() { 
			var frmMain		= $("#frmMain");
			var loginType	= $("input[name=login_type]").val();
			
			// 구매자 회원가입 [TODO: @여부 확인 추가)]
			if (loginType.equals("mbr")) {
				if (document.getElementById("id").value.length < 6
						|| document.getElementById("id").value.length > 32) {
					alert("이메일(아이디)를 6 ~ 16자 이내로 입력하세요!");
					document.getElementById("email").focus();
					return;
				}
				
				frmMain.action = "/front/login/loginProc.web";
			}
			// 판매자 회원가입
			else {
				if (document.getElementById("id").value.length < 6
						|| document.getElementById("email").value.length > 32) {
					alert("이메일(아이디)를 6 ~ 16자 이내로 입력하세요!");
					document.getElementById("id").focus();
					return;
				}
				
				frmMain.action = "/seller/login/loginProc.web";
			}

			// 비밀번호 확인
			if (document.getElementById("passwd").value.length < 8
					|| document.getElementById("passwd").value.length > 16) {
				alert("비밀번호를 8 ~ 16자 이내로 입력하세요!");
				document.getElementById("passwd").focus();
				return;
			}
			
			frmMain.submit();
		}
		
		function changeTab(type) {
			
			if (type == 1) {
				$("input[name=login_type]").val("mbr");
				$(".tab li").eq(0).addClass("active");
				$(".tab li").eq(1).removeClass("active");
				$(".mbr").css("display","block");
				$(".sll").css("display","none");
			}
			else {
				$("input[name=login_type]").val("sll");
				$(".tab li").eq(1).addClass("active");
				$(".tab li").eq(0).removeClass("active");
				$(".mbr").css("display","none");
				$(".sll").css("display","block");
			}
		}
	</script>
</head>
<body>
	<header class="header">
		<%@ include file="/include/common/top.jsp" %>
	</header>
	
	<section class="content">
		<nav></nav>
		<article class="login">
			<h3>로그인</h3>
			<form id="frmMain" name="frmMain" method="POST">
				<input type="hidden" name="login_type" value="mbr">
				<ul class="tab">
					<li class="active" onclick="changeTab(1)">구매자</li>
					<li onclick="changeTab(2)">판매자</li>
				</ul>
				<div class="loginArea">
					<ul>
						<li>
							<input type="text" id="id" name="id" value="" maxlength="32" required placeholder="아이디" autocomplete=off />
						</li>
						<li>
							<input type="password" id="passwd" name="passwd" value="" maxlength="16" required placeholder="비밀번호" />
						</li>
					</ul>
					<input type="button" value="로그인" onClick="checkForm();">
				</div>
				<div class="saveID">
					<input type="checkbox" id="checkID" name="checkID"> <label for="checkID">아이디 저장</label>
				</div>
			</form>
			<div>
				<a href="#">아이디/비밀번호 찾기</a>
				<span class="mbr"><a href="/front/member/agree.web">구매자 회원가입</a></span>
				<span class="sll"><a href="/seller/sellers/agree.web">판매자 회원가입</a></span>
			</div>
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