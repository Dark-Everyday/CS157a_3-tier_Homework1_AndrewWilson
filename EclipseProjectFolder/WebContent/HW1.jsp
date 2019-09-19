<%@ page import="java.sql.*" %> 
<html>
<head>
<title>3-Tier Architecture, Homework 1, cs157A</title>
</head>
<body>
<% 
	String db = request.getParameter("root");
	String user = "cs157a";
	try {
		Class.forName("com.mysql.jdbc.Driver"); 	
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/cs157a?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root","xr19ALPHA");

		
		out.println(db + " database successfully opened."); 
		
		Statement stmt = con.createStatement();
		String id = request.getParameter("ID"), name =request.getParameter("Name"), age = request.getParameter("Age");
		
		ResultSet rs = stmt.executeQuery("select * from hw1");
		
		%>
		<table>
			<tr>
			<td>Student ID</td>
			<td>Name </td>
			<td>Age</td>
			</tr>
		<%
		while(rs.next())
		{

			%>

			<tr>
			<td> <%=rs.getInt(1)%></td>
			<td><%=rs.getString(2)%> </td>
			<td> <%=rs.getInt(3)%></td>
			</tr>
			<%  
			out.println("<br/>");
		}
		%>
		</table>
		<%
	}
	catch(SQLException e) { 
		out.println("SQLExceptioncaught: " +e.getMessage()); 	
	}
	%>
	
</body>
</html>