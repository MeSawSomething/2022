<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script>
		function check(){
			var doc=document.formProfessor;
				if(doc.idx.value==0){
					alert("강사ID가 입력되지 않았습니다");
					doc.idx.focus();
					return false;
				}
				if(doc.idx.value.length<4||doc.idx.value.length>12){
					alert("강사 ID는 4자리 이상 12자리 이하입니다.");
					doc.idx.focus();
					return false;
				}
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
				}doc.submit();
		}
	</script>
</head>
<%@include file = "header.jsp" %>
<%@include file = "nav.jsp" %>
<body>
<section>
<%@ include file = "DBConn.jsp" %>
<%
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	int count=0;
	try{
		String sql = "select max(idx) from lecturer0509";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			count=rs.getInt(1)+1;
		}
		
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
<h2>강사추가</h2>
	<form name="formProfessor" method="post" action="professorAddProcess.jsp">
		<table border=1 id=table1>
			<tr>
				<th>강사ID</th>
				<td><input type="number" name="idx" value="<%=count %>"></td>
			<tr>
				<th>강사명</th>
				<td><input type=text name=name></td>
			</tr>
			<tr>
				<th>전공</th>
				<td><input type=text name=major></td>
			</tr>
			<tr>
				<th>연구분야</th>
				<td><input type=text name=field></td>
			</tr>
			<tr>
				<td colspan="2">
				<a href="강사조회"><input type="button" id="button1" value="목록"></a>
				<input type="button" id="button1" value="등록" onclick="check()">
				</td>
			</tr>
		</table>
	</form>
</section>
<%@include file = "footer.jsp" %>
</body>
</html>