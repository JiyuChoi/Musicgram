<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/nav.jsp"/>
<h3>회원정보 변경</h3>

    
		<form action="updateProfile" method="post" enctype="multipart/form-data">
			<table>
		        <tr>
		            <td>사진 변경</td>
		            <td><input type="file" name="file"></td>
		        </tr>
		        <tr>
		        	<td>자기소개 변경</td>
		        	<td><input type="text" name="user_description" value="${user_description}"></td>
		        </tr>
		        <tr>
		        	<td>비밀번호 변경</td>
		        	<td><input type="text" name="user_password"  value="${user_password}"></td>
		        </tr>
			</table>  
			<input type="submit" value="Submit">
			<input type="button" onclick="history.go(-1);" value="변경 취소">
		</form>
		
		<%
			String updateErrMsg = (String) session.getAttribute("updateErrMsg");
			if(updateErrMsg != null){ %>
				<span style="color:red;"><%=updateErrMsg%></span>
		<%	}
			session.removeAttribute("updateErrMsg");
		%>
	
</body>
</html>