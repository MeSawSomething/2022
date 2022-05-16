<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강사 수정</title>
	<script>
		function check(){
			var doc=document.formProfessor;
				if (doc.name.value==0){
					alert("강사명이 입력되지 않았습니다");
					doc.name.focus();
					return false();
				}
				if (doc.major.value==0){
					alert("전공이 입력되지 않았습니다");
					doc.major.focus();
					return false();
				}
				if (doc.field.value==0){
					alert("연구분야가 입력되지 않았습니다");
					doc.field.focus();
					return false();
				}else{
					doc.submit();
					alert("등록이 완료되었습니다");
					return false;
				}
		}
	</script>
</head>
<%@include file = "header.jsp" %>
<%@include file = "nav.jsp" %>
<body>
<section>
<%@include file= "DBConn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
		String idx = request.getParameter("idx");
		try{
			String sql = "update lecturer0509 set name=?, major=?, field=? where idx=?";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
				
				//pstmt.executeUpdate();
				 
				 if(rs.next()){
					 String name = rs.getString("name");
					 String major = rs.getString("major");
					 String field = rs.getString("field");
			
%>

<h2>강사 수정페이지</h2>
	<form name="formProfessor" method="post" action="professorAddProcess.jsp">
		<table border=1 id=table1>
			<tr>
				<th>강사ID</th>
				<td><input type="number" name="idx" value="<%=idx %>"></td>
			<tr>
				<th>강사명</th>
				<td><input type=text name=name value="<%=name %>"></td>
			</tr>
			<tr>
				<th>전공</th>
				<td><input type=text name=major value="<%=major %>"></td>
			</tr>
			<tr>
				<th>연구분야</th>
				<td><input type=text name=field value="<%=field %>"></td>
			</tr>
			<tr>
				<td colspan="2">
				<a href="강사조회"><input type="button" id="button1" value="목록"></a>
				<input type="button" id="button1" value="등록" onclick="check()">
				</td>
			</tr>
			<%
				 }
					}catch(SQLException e){
						e.printStackTrace();
						System.out.println("데이터 수정 실패");
						
					}
			
			%>
		</table>
	</form>
</section>
<%@include file = "footer.jsp" %>
</body>
</html>