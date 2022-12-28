<%@ page import="java.sql.*"%>
<%
try
{
    Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","vignan","143");    
    Statement stmt = con.createStatement();
    ResultSet flag=stmt.executeQuery("select * from website");
    if(flag.next())
    {
        ResultSet rs=stmt.executeQuery(" select * from website ");
        ResultSetMetaData rsmd=rs.getMetaData();
        int n=rsmd.getColumnCount();
        out.print("<center><table><tr>");
        for(int i=1;i<=n;i++)
        out.print("<td><b>"+rsmd.getColumnLabel(i)+"</b></td>");
        out.print("</tr>");
        while(rs.next())
        {
            out.print("<tr>");
            for(int i=1;i<=n;i++)
            out.print("<td>"+rs.getString(i)+"</td>");
            out.print("</tr>");
        }
        out.print("</table></center>");
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