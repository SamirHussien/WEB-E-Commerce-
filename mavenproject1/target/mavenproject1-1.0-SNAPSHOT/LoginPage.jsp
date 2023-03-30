<%-- 
    Document   : LoginPage
    Created on : Mar 26, 2023, 8:02:04 AM
    Author     : hp
--%>

<%@page import="com.iti.ConnectToDataBase"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping</title>
    </head>
    <body>
        <% String username= request.getParameter("username");
        String pass= request.getParameter("password");
        Connection con=new ConnectToDataBase().getconnection();
        Statement stmt = con.createStatement();
        String sql="SELECT * FROM users where name ='"+username+"' and password='"+pass+"';";
        ResultSet re=stmt.executeQuery(sql);
//        String user =re.getString("name");
//        String passw=re.getString("password");
//        
        HttpSession newsesession=null;
        if (re.next()){
            String group=re.getString("group_type");
            newsesession=request.getSession(true);
            newsesession.setAttribute("login", "true");
//            newsesession.getAttribute("login").equals("true")
            if (group.equalsIgnoreCase("user")&&newsesession !=null){
            response.sendRedirect("index_1.html");
            }else if (group.equalsIgnoreCase("admin")&&newsesession!=null)
            {response.sendRedirect("index.html");}
            }
        
          else{
        %>

        <form method="get" action="LoginPage.jsp">
            user name : <input type="text" name="username">
            Password : <input type="password" name="password">
            <input type="submit"><br><!-- comment -->
            create your account:<a href="register.jsp">Register </a>
        </form>
        <%
            newsesession=request.getSession(false );
            newsesession.setAttribute("login","false");
            }%>
    </body>
</html>
