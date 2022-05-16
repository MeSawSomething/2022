<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강사 조회</title>
</head>
<body>
<%@ include file ="DBConn.jsp" %>
<%@ include file = "header.jsp" %>
<%@ include file = "nav.jsp" %>
<section>
	<%
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int count=0;
		try{
			String sql="select * from lecturer0509 where id=?";
			pstmt = con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				count=rs.getInt(1);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	
	%>
	<h2>강사 리스트</h2>
	
	<table border=1 id=table1>
		<tr>
			<th>강사코드</th>
			<th>강사명</th>
			<th>전공</th>		
			<th>세부전공</th>	
			<th>관리</th>		
		</tr>
			<%
			//PreparedStatement pstmt = null;
			//ResultSet rs = null;
				try{
					String sql = "select * from lecturer0509";
					pstmt = con.prepareStatement(sql);
						rs = pstmt.executeQuery();
					
					while(rs.next()){
						String idx = rs.getString("idx");
						String name = rs.getString("name");
						String major = rs.getString("major");
						String field = rs.getString("field");
						
	
			%>
		<tr>
			<td><%=idx %></td>
			<td><%=name %></td>
			<td><%=major %></td>
			<td><%=field %></td>
			<td>
				<a href="professorEdit.jsp?idx=<%=idx%>">수정</a>/
				<a href="professorDeleteProcess.jsp?idx=<%=idx%>" onclick="if(!confirm('정말로 삭제하시겠습니까?'))return false;">삭제</a>
			</td>
		</tr>
			<%
						}
				}catch(SQLException e){
					e.printStackTrace();
					System.out.println("데이터 불러오기 실패");
				}
				
			%>
	</table>

</section>
<%@ include file = "footer.jsp" %>
</body>
</html>