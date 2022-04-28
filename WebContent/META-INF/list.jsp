<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<% 
	// 연결된 정보와 SQL
	String url="jdbc:mariadb://localhost:3306/juntaedb";
	String user = "juntae";
	String passwd = "1111";
	//1. DB 연동 드라이버 로드
	Class.forName("org.mariadb.jdbc.Driver");
	
	//2. 연결 객체 생성
	Connection con = DriverManager.getConnection(url, user, passwd);
	
	//3. 생성된 연결을 통해 SQL문 실행 의뢰 준비
	String sql = "SELECT * FROM LOGIN";
	Statement st = con.createStatement();
	
	//4. SQL 실행
	ResultSet rs = st.executeQuery(sql);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src = "https://ajax.googleapis.com/ajax/libs/jquary/3.4.1/jquery.min.js"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src = "https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container"><br>
	<h1 class="text-center font-weight-bold">로그인정보</h1>
	<br>
	<table class ="table table-hover">
	<tr>
		<th>아이디</th>
		<th>이름</th>
		<th>비빌먼호</th>
	</tr>
<%
//5. 결과집합 처리
while (rs.next()){
	String id = rs.getString("ID");
	String name = rs.getString("NAME");
	String pwd = rs.getString("PWD");

%>		
	<tr>
	<td><%=id %></td>
	<td><%=name %></td>
	<td><%=pwd %></td>
</tr>
<%}
	//6. 연결 해제
	con.close();
	st.close();
	rs.close();
%>
</table>
</div>
</body>
</html>