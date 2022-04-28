<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	String id = request.getParameter("id");
	String name = "";
	String pwd = "";
	String action = "insertPro.jsp";
	
	if(id!=null || id == ""){
		
	//1. jdbc driver 등록
	Class.forName("org.mariadb.jdbc.Driver");
	
	//2. db 와 연결(Connection) 생성
	String url = "jdbc:mariadb://localhost:3306/juntaedb";
	String user = "juntae";
	String passwd = "1111";
	Connection con = DriverManager.getConnection(url, user, passwd);

	//3. DB 연동
	String sql = "select id, name , pwd from login where id=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	ResultSet rs = pstmt.executeQuery();
	
	
	//4. 결과 셋에서 데이터 출력하기
	rs.next();
	name = rs.getString("name");
	pwd = rs.getString("pwd");
	
	action = "updatePro.jsp";
	
	} else {
	id="";
	}
	
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<h2>로그인</h2>
	<form name="Login" action="<%=action %>" method="post">
	아이디 : <input type="text" name="id" value="<%=id %>"><br>
	이름 : <input type="text" name="name" value="<%=name %>"><br>
	암호 : <input type="text" name="pwd" value="<%=pwd %>"><br><br>
	<input type="submit" value="변경저장">
	<button type="button" onclick="Location.href='delete.jsp?id=<%=id %>'">삭제</button>
	<button type="button" onclick="Location.href='list.jsp'">사용자 조회</button>
	</form>
</body>
</html>