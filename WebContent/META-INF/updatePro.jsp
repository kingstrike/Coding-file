<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import=java.sql.*"%>
<% request.setCharacterEncoding("uft-8");

//1.DB 연동 드라이버 로드
Class.forName("org.mariadb.jdbc.Driver");

//2. 연결 객체 생성
String url = "jdbc:mariadb://localhost:3306/juntaedb";
String user = "JUNTAE";
String passwd = "1111";
Connection con = DriverManager.getConnection(url, user, passwd);

//3. 생성된 연결읉 통해 SQL문으로 실행 의뢰 준비
PreparedStatement pstmt = con.preparedStatement(sql);

pstmt.setString(1, request.getParameter("id"));
pstmt.setString(2, request.getParameter("name"));
pstmt.setString(3, request.getParameter("pwd"));

//4. sql문 실행
int i = pstmt.executeUpdate();

//5. 객체 해제
pstmt.close();
con.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
	let ans = alert("변경되었습니다!");
	if (!ans){
		loaction.href='list.jsp';
	}
	
	</script>
</body>
</html>