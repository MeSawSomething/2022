<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file = "DBConn.jsp" %>
<%
	String idx = request.getParameter("idx");
	String name = request.getParameter("name");
	String major = request.getParameter("major");
	String field = request.getParameter("field");

	PreparedStatement pstmt = null;
	
	try{
		String sql = "insert into lecturer0509 values(?,?,?,?)";
		pstmt = con.prepareStatement(sql);
		
			pstmt.setString(1, idx);
			pstmt.setString(2, name);
			pstmt.setString(3, major);
			pstmt.setString(4, field);
			
			pstmt.executeUpdate();
		%>
		<script>
			alert("저장에 성공했습니다!");
			location.href="professorSelect.jsp";
		</script>
		<%
			
		}catch(SQLException e){
			System.out.println("데이터 수정 실패");
			e.printStackTrace();
		}
	

	
	
	
	
%>