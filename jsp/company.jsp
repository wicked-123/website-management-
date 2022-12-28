<%@page import="java.sql.*"%>
<%
String cid=request.getParameter("cid");
String ip1=request.getParameter("add");
String m=request.getParameter("cna");
String status=request.getParameter("ceoname");
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","vignan","143");
	PreparedStatement ps=conn.prepareStatement("insert into webcompany values(?,?,?,?)");
	ps.setString(1,cid);
	ps.setString(2,ip1);
	ps.setString(3,m);
	ps.setString(4,status);

	int x=ps.executeUpdate();
	if(x!=0)
	{
		out.print("done successfully");
	}else{
		out.print("Somthing went wrong");
	}
}catch(Exception e){
out.print(e);
}

%>