<%@page import="java.sql.*"%>
<%
String id=request.getParameter("id");
String name=request.getParameter("aname");
String pass=request.getParameter("apass");
String wid=request.getParameter("web_id");

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","vignan","143");
	PreparedStatement ps=conn.prepareStatement("insert into webpages values(?,?,?,?)");
	ps.setString(1,id);
	ps.setString(2,name);
	ps.setString(3,pass);
	ps.setString(4,wid);
	int x=ps.executeUpdate();
	if(x!=0)
	{
		out.print("signup done successfully");
	}else{
		out.print("Somthing went wrong");
	}
}catch(Exception e){
out.print(e);
}

%>