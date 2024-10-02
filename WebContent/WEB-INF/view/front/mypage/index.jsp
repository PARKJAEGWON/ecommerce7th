<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page info="/front/mypage/index.jsp"%>
<!DOCTYPE html>
<html lang="kr">

<head>
	<%@ include file="/include/common/header.jsp"%>
	<%@ include file="/include/common/top.jsp"%>
</head>

<body>
	<header class="header">
		<section class="shop spad">
			<div class="container">
				<div class="row">
					<%@ include file="/include/front/lnbMyPage.jsp"%>
				</div>
			</div>
		</section>
	</header>
	<footer>
		<%@ include file="/include/common/footer.jsp"%>
	</footer>
</body>
</html>