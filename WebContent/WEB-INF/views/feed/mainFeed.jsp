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

<style type="text/css">
	.box {
    width: 50px;
    height: 50px; 
    border-radius: 70%;
    overflow: hidden;
    display: inline-block;
	}
	.profile {
	    width: 100%;
	    height: 100%;
	    object-fit: cover;
	}
</style>

</head>
<body>
	<jsp:include page="/nav.jsp" />
	<div class="container">
	<a href="#" onclick="location.href='upload.jsp'">upload</a>
		<div class="row">
			<div class="col-7">
					<c:forEach var="content" items="${contentList}">
						<div class="card"   >
							<div class="card-header">
								<!-- <td>${content.content_no}</td> -->
								<div class="box" style="background: #ffffff;">
									<img class="profile" src="/musicgram/profile/${content.user_id}"
										onerror="this.src='/musicgram/img/default.png'">
								</div>
								<span>${content.user_id}</span>
							</div>
							<div class="card-body">
								<iframe width="560" height="315" src="https://www.youtube.com/embed/${content.youtube_url}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
									
									<p><a href="content/pressLike/${content.content_no}" class="card-link">좋아요</a></p>
									<button onclick="pressLike(${content.content_no},${content.like_count})">좋아요</button>
									
									<p><a href="content/cancelLike/${content.content_no}" class="card-link">좋아요 취소</a></p>
									<button onclick="cancelLike(${content.content_no},${content.like_count})">좋아요 취소</button>
									
								<p >좋아요 개수 <span id="countLike${content.content_no}">${content.like_count}</span></p>
								<p>${content.text}</p>
							</div>
							<ul>
								<a href="content/${content.content_no}" class="card-link">자세히 보기</a>
								<c:if test="${content.user_id eq user_id}">
									<a href="content/update/${content.content_no}" class="card-link">수정</a>
									<a href="content/delete/${content.content_no}" class="card-link">삭제</a>
								</c:if>
							</ul>
							
						</div>
					<br><br><br>
					</c:forEach>
			</div>
		</div>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>﻿

<script>

function pressLike(content_no, like_count){
	$.ajax({
		url:"content/pressLike",
		type:"post",
		data: {"content_no" : content_no},
		async: false,
		success : function(result){
			console.log(result);
			$('#countLike'+content_no).html(result);
		},
		error: function(e){
			console.log(e);
		}
	})
} 

function cancelLike(content_no, like_count){
	$.ajax({
		url:"content/cancelLike",
		type:"post",
		data: {"content_no" : content_no},
		async: false,
		success : function(result){
			console.log(result);
			$('#countLike'+content_no).html(result);
		},
		error: function(e){
			console.log(e);
		}
	})
} 

function isPressLike(content_no){
	$.ajax({
		url:"content/isPressLike",
		type:"post",
		data: {"content_no" : content_no},
		async: false,
		success : function(result){
			console.log(result);
		},
		error: function(e){
			console.log(e);
		}
	})
}

</script>
</html>