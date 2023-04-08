<%-- 
    Document   : Phone_User_List
    Created on : Apr 7, 2023, 12:12:57 AM
    Author     : hp
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.iti.ConnectToDataBase"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/List.css">
    </head>
    <body>
        <h1>Hello from phone list page</h1>
        <%
            Connection con = new ConnectToDataBase().getconnection();
            Statement st = con.createStatement();
            String sql = "SELECT * FROM prod where prod_type='phone'";
            ResultSet re = st.executeQuery(sql);
            ArrayList<String> prod_name = new ArrayList<String>();
            ArrayList<String> prod_descrip = new ArrayList<String>();
            ArrayList<String> prod_price = new ArrayList<String>();
            ArrayList<String> prod_src = new ArrayList<String>();
            while (re.next()) {
                prod_name.add(re.getString("prod_name"));
                prod_descrip.add(re.getString("prod_description"));
                prod_price.add(re.getString("prod_price").toString());
                prod_src.add(re.getString("prod_src"));
            }
            // get result set of column form database as array 
            //product name array 
            String[] prod_name_arr = new String[prod_name.size()];
            prod_name_arr = prod_name.toArray(prod_name_arr);
            //product description
            String[] prod_descrip_arr = new String[prod_descrip.size()];
            prod_descrip_arr = prod_descrip.toArray(prod_descrip_arr);
            //product price
            String[] prod_price_arr = new String[prod_price.size()];
            prod_price_arr = prod_price.toArray(prod_price_arr);
            //source of product
            String[] prod_src_arr = new String[prod_price.size()];
            prod_src_arr = prod_src.toArray(prod_src_arr);
            int i = 0;
//            
            re=st.executeQuery(sql);
            while (re.next()) {
        %>
        <main>
            <div class="product">
                <img src="<%out.print(prod_src_arr[i]);%>" alt="Product Image">
                <!--<h2><% //out.print(prod_name_arr[i]);%></h2>-->
                <h2><%out.print(re.getString("prod_name"));%></h2>
                <!--<p><% //out.print(prod_descrip_arr[i]);%></p>-->
                <p><%out.print(re.getString("prod_description"));%></p>
                <!--<p><% //out.print(prod_price_arr[i]);%></p>-->
                <p><%out.print(re.getString("prod_price").toString());%></p>
                <button>Add to Cart</button>
            </div>            

        </main>



        <%i++;}
%>
    </body>
</html>
