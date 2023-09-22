<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<table width="500" cellpadding="0" cellspacing="0" border="1">
		<tr>
			<td>번호</td>
			<td>이름</td>
			<td>제목</td>
			<td>날짜</td>
			<td>히트</td>
		</tr>

		<c:forEach items="${bList}" var="dto">
		<tr>
			<td>${dto.bId}</td>
			<td>${dto.bName}</td>
			<td>
				<a href="content_view.do?bId=${dto.bId}">${dto.bTitle}</a></td>
			<td><fmt:formatDate value="${dto.bDate}" pattern="yyyy-MM-dd"/></td>
			

			<td>${dto.bHit}</td>
		</tr>

		</c:forEach>
		<tr>
			<td colspan="5"> <a href="write_view.do">글작성</a> </td>
		</tr>

	</table>
	
</body>
</html>