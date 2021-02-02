<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>instagram</title>
    <link rel="stylesheet" href="/musicgram/css/reset.css">
    <link rel="stylesheet" href="/musicgram/css/common.css">
    <link rel="stylesheet" href="/musicgram/css/style.css">
    <link rel="stylesheet" href="/musicgram/css/profile.css">
    <!-- <link rel="shortcut icon" href="/musicgram/img/logo.png">-->

</head>
<body>

<jsp:include page="/nav.jsp"/>

<section id="container">

    <div id="main_container"  style="padding-top:300px;">

        <section class="b_inner">

            <div class="hori_cont">
                <div class="profile_wrap">
                    <div class="profile_img">
                        <img class="profile" src="/musicgram/profile/${user_id}"
							onerror="this.src='/musicgram/img/default.png'">
                    </div>
                </div>

                <div class="detail">
                	
                   <div class="top">
                    <div class="user_name">${user.user_id}</div>
	                	<c:if test="${session_id eq user.user_id }" >
	                        <a href="/musicgram/user/updateProfileForm" class="profile_edit">프로필편집</a>
	                        <a href="/musicgram/user/logout" class="logout">로그아웃</a>
	                	</c:if>
                    </div>
                    

                    <ul class="middle">
                        <li>
                            <span>게시물</span>
                           ${countContent }
                        </li>
                        <li>
                            <span>팔로워</span>
                            3
                        </li>
                        <li>
                            <span>팔로우</span>
                            3
                        </li>
                    </ul>
                    <p class="about">
                        <span class="nick_name">${user.email}</span>
                        <span class="book_mark">${user.description }</span>
                    </p>

                </div>
            </div>

            <div class="mylist_contents contents_container active">
                <c:forEach var="content" items="${contentList}">
	                <div class="pic">
	                    <a href="/musicgram/content/${content.content_no }">
		                	<img width="320" height="180" src="https://img.youtube.com/vi/${content.youtube_url}/mqdefault.jpg" >
		                </a>
	                </div>
				</c:forEach>
            </div>
        </section>
    </div>
</section>

<script src="/musicgram/js/profile.js"></script>
</body>
</html>