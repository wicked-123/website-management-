<%@ page import="java.sql.*"%>
<link rel="stylesheet" href="ntg.css">
<%
try
{
    Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","vignan","143");    
    Statement stmt = con.createStatement();
    ResultSet flag=stmt.executeQuery("select * from admin");
    if(flag.next())
    {
        ResultSet rs=stmt.executeQuery("select * from admin");
        ResultSetMetaData rsmd=rs.getMetaData();
        int n=rsmd.getColumnCount();
        out.print("<body><center><head>company details</head><br><br><br><br><br><br><table><tr></tr>");
        for(int i=1;i<=n;i++)
        out.print("<th>"+rsmd.getColumnLabel(i)+"</th>");
        out.print("</tr>");
        while(rs.next())
        {
            out.print("<tr>");
            for(int i=1;i<=n;i++)
            out.print("<td>"+rs.getString(i)+"</td>");
            out.print("</tr>");
        }
        out.print("</table></center></body>");
        rs.close();
    }
    else
    {
        out.print("<center><h3>No data exist</h3></center>");
    }
    flag.close();
    con.close();
}
catch(Exception e)
{
	out.println(e);
}
%>