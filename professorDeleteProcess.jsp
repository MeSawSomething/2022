<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<%@ include file="DBConn.jsp"%>
<%
	request.setCharacterEncoding("utf-8");

		String idx = request.getParameter("idx");
		//String name = request.getParameter("name"); 이건 아이디랑 이름 입력하고 삭제하는 방식일때.
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			String sql = "delete from lecturer0509 where idx=?";
				pstmt = con.prepareStatement(sql);	
					pstmt.setString(1, idx);
					rs = pstmt.executeQuery();
				
	%>
		<script>
			alert("데이터 삭제 성공");
			location.href = "professorSelect.jsp";
		</script>
	<%
			
		}catch(SQLException e){
			e.printStackTrace();
			System.out.println("데이터 삭제 실패");
		}
		
%>