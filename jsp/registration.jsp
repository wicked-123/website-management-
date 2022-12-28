<%@page import="java.sql.*"%>
<%
String name=request.getParameter("firstName");
String ema=request.getParameter("email");
String g=request.getParameter("Gender");
String pass=request.getParameter("password");
String cpass=request.getParameter("cpassword");

if(pass.equals(cpass))
{
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","vignan","143");
	PreparedStatement ps=conn.prepareStatement("insert into registration values(?,?,?,?,?)");
	ps.setString(1,name);
	ps.setString(2,ema);
	ps.setString(3,g);
	ps.setString(4,pass);
	ps.setString(5,cpass);
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
}
else
{
out.print("password not matching");
}
%>