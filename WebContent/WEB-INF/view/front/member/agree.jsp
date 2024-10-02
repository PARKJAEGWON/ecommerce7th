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
<%@ page info="/WEB-INF/view/front/member/agree.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/front/header.jsp" %>
	<style>
		.agree {width:550px;margin:50px auto 100px;padding:30px 20px;text-align:center;}
		.agree h3 {margin:0 0 50px;}
		
		.agreeArea {text-align:left;}
		
		#allTerm ~ label {font-weight:bold;}
		
		textarea {width:100%;height:200px;padding:5px 5px 0 3px;resize:none;overflow-y:scroll;
				/* firefox - scrollbar style */
				scrollbar-width: 3px;
				scrollbar-color: #ccc;
		}
		/* chrome & edge & safari & opera - scrollbar style */
		textarea::-webkit-scrollbar {
			width: 5px;
			transition: width 2s;
		}
		textarea::-webkit-scrollbar-thumb {
			background-color: #ccc;
			border-radius: 5px;
		}
		
		input[type=button] {display:block;width:300px;height:50px;margin:30px auto 0;line-height:50px;background:#007bff;color:white;border-radius:10px;border:none;}
		
	</style>
	<script>
		window.onload = function () {
			
			// 전체 동의 클릭시
			$("#allTerm").on("click", function() {
				console.log($(this).prop("checked"));
				if ($(this).prop("checked")) {
					$("input[name^=term]").prop("checked", true);
				}
				else {
					$("input[name^=term]").prop("checked", false);
				}
			});
			
			// 각 동의 항목 클릭시
			$("input[name^=term]").on("click", function() {
				var chkLength = $("input[name^=term]:checked").length;		// 전체 동의 제외 체크된 체크박수 수
				
				if (chkLength == 3) $("#allTerm").prop("checked", true);
				else $("#allTerm").prop("checked", false);
			})
		}
		
		function goRegister() {
			$frm = $("#frmMain");
			
			if ($("input[name=term_1]").prop("checked")) {
				$frm.attr("action", "/front/member/registerForm.web");
				$frm.submit();
			}
			else {
				alert("필수 약관에 동의해주세요!");
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
		<article class="agree">
			<h3>이용약관</h3>
			<form id="frmMain" name="frmMain" method="POST">
				<div class="agreeArea">
					<p>
						<input type="checkbox" id="allTerm">
						<label for="allTerm">전체 동의</label>
					</p>
					<p>
						<input type="checkbox" id="term_1" name="term_1" value="Y">
						<label for="term_1">[필수]이용 약관</label>
						<textarea>긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장긴문장</textarea>
					</p>
					<p>
						<input type="checkbox" id="term_2" name="term_2" value="Y">
						<label for="term_2">[선택]마케팅 수신 동의</label>
						<textarea></textarea>
					</p>
					<p>
						<input type="checkbox" id="term_3" name="term_3" value="Y">
						<label for="term_3">[선택]제 3자 개인 정보 제공 동의</label>
						<textarea></textarea>
					</p>
				</div>
				<input type="button" onclick="goRegister()" value="다음">
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