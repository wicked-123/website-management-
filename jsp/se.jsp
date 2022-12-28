<%@page import="java.sql.*"%>
<%
String ip1=request.getParameter("ip");
String m=request.getParameter("memory");
String status=request.getParameter("a");
String bd=request.getParameter("b");
String cpn=request.getParameter("p");
String wid=request.getParameter("web_id");
String cid=request.getParameter("c_id");


try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","vignan","143");
	PreparedStatement ps=conn.prepareStatement("insert into webserver values(?,?,?,?,?,?,?)");
	ps.setString(1,ip1);
	ps.setString(2,m);
	ps.setString(3,status);
	ps.setString(4,bd);
	ps.setString(5,cpn);
	ps.setString(6,wid);
	ps.setString(7,cid);
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