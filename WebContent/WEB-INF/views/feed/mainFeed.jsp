<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="samsung.spring.musicgram.dao.*"%>
<%@ page import="samsung.spring.musicgram.dto.*"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/nav.jsp" />

	<c:forEach var="genreContent" items="${genreContentsList}">
		<tr>
			<td>${genreContent.content_no}</td>
			<td>${genreContent.user_id}</td>
			<td>
				<iframe width="560" height="315" src="${genreContent.youtube_url}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			</td>
			<td>${genreContent.text}</td>
			<td>${genreContent.genre}</td>
			<td>${genreContent.tag}</td>
			<td>${genreContent.like_count}</td>
			<td>${genreContent.create_date}</td>
		</tr>
	</c:forEach>

	<c:forEach var="tagContent" items="${tagContentsList}">
		<tr>
			<td>${tagContent.content_no}</td>
			<td>${tagContent.user_id}</td>
			<td>
				<iframe width="560" height="315" src="${tagContent.youtube_url}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			</td>
			<td>${tagContent.text}</td>
			<td>${tagContent.genre}</td>
			<td>${tagContent.tag}</td>
			<td>${tagContent.like_count}</td>
			<td>${tagContent.create_date}</td>
		</tr>
	</c:forEach>

	${likeCount}

	<a href="#" onclick="location.href='upload.jsp'">upload</a>
	<table>
		<c:forEach var="content" items="${contentList}">
			<tr>
				<td>${content.content_no}</td>
				<td>${content.user_id}</td>
				<td>
					<iframe width="560" height="315" src="${content.youtube_url}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
				</td>
				<td>${content.text}</td>
				<td><a href="content/update/${content.content_no}">수정</a></td>
				<td><a href="content/delete/${content.content_no}">삭제</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>