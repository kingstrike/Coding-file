<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"%>
<% String id = request.getParameter("id");

//1. jdbc driver를 로드한다.
Class.forName("org.mariadb.jdbc.Driver");

//2. db와의 연결(connection)을 생성한다.
String url = "jdbc:mariadb://localhost:3306/juntaedb";
String user = "juntae";
String passwd = "1111";
Connection con = DriverManager.getConnection(url, user, passwd);

//3. 연결 후  그 통로를 통해 sql문을 실행한다.
String sql = "select * from login where id=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1,id);

//4.sql문 실행
ResultSet rs = pstmt.executeQuery();

//5.변환된 데이터 출력
rs.next();
String name=rs.getString("name");
String pwd2=rs.getString("pwd");

//6.객체 해지
rs.close();
pstmt.close();
con.close();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멤버 정보 변경</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src = "https://ajax.googleapis.com/ajax/libs/jquary/3.4.1/jquery.min.js"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src = "https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
	<br>
	<h2 class="text-center font-weight-bold">사용자 정보 변경</h2>
	</hr>	
	<form action="updatePro.jsp" method="post">
		<div class="form-group">
			<label for="id">ID:</label>
			<input type="next" class="form-control" id="id" name="id" value="<%=id%>">
		</div>
		<div class="form-group">
			<label for="name">NAME:</label>
			<input type="next" class="form-control" id="name" name="name" value="<%=name%>">
		</div>
		<div class="form-group">
			<label for="id">PASSWORD:</label>
			<input type="password" class="form-control" id="pwd" name="pwd" value="<%=pwd2%>">
		</div>
		<br>
		<div class="text-center">
			<input type="submit" value="변경" class="btn btn-secondary">
			<input type="submit" value="변경" class="btn btn-secondary" onclick="Location.href='delete.jsp?id=<%=id%>'">
			<input type="submit" value="변경" class="btn btn-secondary" onclick="location.href='list.jsp'">
		</div>
	</form>
	</div>
</body>
</html>