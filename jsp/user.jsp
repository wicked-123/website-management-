<%@page import="java.sql.*"%>
<%
String fname=request.getParameter("ufname");
String lname=request.getParameter("ulname");
String id=request.getParameter("uid");
String pass=request.getParameter("rpass");
String cpass=request.getParameter("rconfirmpass");
String pass1=request.getParameter("p");


if(pass.equals(cpass))
{
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","vignan","143");
	PreparedStatement ps=conn.prepareStatement("insert into userdetails values(?,?,?,?,?,?)");
	ps.setString(1,fname);
	ps.setString(2,lname);
	ps.setString(3,id);
	ps.setString(4,pass);
	ps.setString(5,cpass);
	ps.setString(6,pass1);
	int x=ps.executeUpdate();
	if(x!=0)
	{
		out.println("Signup done successfully");
	}else{
		out.println("Something went wrong");
	}
}catch(Exception e){
out.print(e);
} 
}
else
{
out.println("password not matching");
}
%>