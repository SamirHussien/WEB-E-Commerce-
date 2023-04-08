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
    <!DOCTYPE html>
    <html lang="en" >
        <head>
            <meta charset="UTF-8">
            <title>Login Form</title>

            <link rel="stylesheet" href="css/style_login.css">

        </head>

        <body>
            <% String username = request.getParameter("username");
                String pass = request.getParameter("password");
                Connection con = new ConnectToDataBase().getconnection();
                Statement stmt = con.createStatement();
                String sql = "SELECT * FROM users where name ='" + username + "' and password='" + pass + "';";
                ResultSet re = stmt.executeQuery(sql);
                //        String user =re.getString("name");
                //        String passw=re.getString("password");
                //        
                HttpSession newsesession = null;
                if (re.next()) {
                    String group = re.getString("group_type");
                    String inter = re.getString("interest");
                    newsesession = request.getSession(true);
                    newsesession.setAttribute("login", "true");
                    //            newsesession.getAttribute("login").equals("true")
                    if (group.equalsIgnoreCase("user") && inter.equalsIgnoreCase("phone") && newsesession != null) {
                        response.sendRedirect("Phone_User_List.jsp");
                    } else if (group.equalsIgnoreCase("user") && inter.equalsIgnoreCase("labtop") && newsesession != null) {
                        response.sendRedirect("Labtop_User_List.jsp");
                    } else if (group.equalsIgnoreCase("admin") && newsesession != null) {
                        response.sendRedirect("index.html");
                    }
                } else {
            %>


            <div class="main">  	
                <input type="checkbox" id="chk" aria-hidden="true">

                <div class="signup">
                    <form action="Validition" method="post">
                        <label for="chk" aria-hidden="true">Sign up</label>
                        <input type="text" name="username" placeholder="User name" required="">
                        <input type="email" name="email" placeholder="Email" required="">
                        <input type="password" name="pass" placeholder="Password" required="">
                        <input type="date" name="birthday" placeholder="birthday" required="">
                        <input name="jop" type="text" placeholder="Jop" required="">
                        <input name="cedit_limit" type="number" placeholder="cedit_limit" required="">
                        <input name="address" type="text" placeholder="address" required="">
                        <input name="interest" type="text" placeholder="interest" required="">
                        <input name="phone_number" type="tel" placeholder="phone_number" required="">
                        <button>Sign up</button>
                        <input type="text" readonly="" style="background-color:#302b63">
                        <input type="text" readonly="" style="background-color: #302b63">
                    </form>
                </div>
                <div class="login">
                    <form action="LoginPage.jsp" method="get">
                        <label for="chk" aria-hidden="true">Login</label>
                        <input type="text" name="username" placeholder="user name" required="">
                        <input type="password" name="password" placeholder="Password" required="">
                        <button>Login</button>
                    </form>
                </div>
            </div>
            <!--            <form method="get" action="LoginPage.jsp">
                            user name : <input type="text" name="username">
                            Password : <input type="password" name="password">
                            <input type="submit"><br> comment 
                            create your account:<a href="register.jsp">Register </a>
                        </form>-->
            <%
                    newsesession = request.getSession(false);
                    newsesession.setAttribute("login", "false");
                }%>

        </body>
    </html>
