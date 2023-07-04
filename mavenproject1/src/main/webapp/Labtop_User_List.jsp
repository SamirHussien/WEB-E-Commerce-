<%-- 
    Document   : Labtop_User_List
    Created on : Apr 7, 2023, 12:13:18 AM
    Author     : hp
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.iti.ConnectToDataBase"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Labtop Page</title>
        <link rel="stylesheet" href="css/List.css">
        <!-- Google Fonts -->
        <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Raleway:400,100' rel='stylesheet' type='text/css'>

        <!-- Bootstrap -->
        <link rel="stylesheet" href="css/bootstrap.min.css">

        <!-- Font Awesome -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="css/responsive.css">
    </head>
    <body>
        <!--head of page--> 
        <div class="header-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        <div class="user-menu">
                            <ul>
                                <li><a href="#"><i class="fa fa-user"></i> My Account</a></li>
                                <li><a href="#"><i class="fa fa-heart"></i> Wishlist</a></li>
                                <li><a href="cart.html"><i class="fa fa-user"></i> My Cart</a></li>
                                <li><a href="checkout.html"><i class="fa fa-user"></i> Checkout</a></li>
                                <li><a href="LoginPage.jsp"><i class="fa fa-user"></i> Login</a></li>
                                <!-- jsp file  -->
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="header-right">
                            <ul class="list-unstyled list-inline">
                                <li class="dropdown dropdown-small">
                                    <a data-toggle="dropdown" data-hover="dropdown" class="dropdown-toggle" href="#"><span class="key">currency :</span><span class="value">USD </span><b class="caret"></b></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">USD</a></li>
                                        <li><a href="#">INR</a></li>
                                        <li><a href="#">GBP</a></li>
                                    </ul>
                                </li>

                                <li class="dropdown dropdown-small">
                                    <a data-toggle="dropdown" data-hover="dropdown" class="dropdown-toggle" href="#"><span class="key">language :</span><span class="value">English </span><b class="caret"></b></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">English</a></li>
                                        <li><a href="#">French</a></li>
                                        <li><a href="#">German</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- End header area -->
        <!--java code--> 
        <%
            String[] list = new String[]{"https://images.esellerpro.com/2131/I/158/528/DSC_0001.JPG", "https://th.bing.com/th/id/R.9fe1a10b8dfe978678d2b4abeb839016?rik=ilAZFod7G%2bgqEw&pid=ImgRaw&r=0", "https://ca.dynabook.com/images/shop/series/portege/x40/PortegeX40-bg7-laptop.png", "https://th.bing.com/th/id/OIP.xsbGskhwL7XZdJ2kx-kNAgHaE8?pid=ImgDet&rs=1"};
            Connection con = new ConnectToDataBase().getconnection();
            Statement st = con.createStatement();
            String sql = "SELECT * FROM prod where prod_type='labtop'";
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
            while (i < prod_price_arr.length) {  
        %>
        <main>
            <div class="product">
                 <img src="<%out.print(prod_src_arr[i]);%>" alt="Product Image">
                <h2><%out.print(prod_name_arr[i]);%></h2>
                <!--<h2><% //out.print(re.getString("prod_name"));%></h2>-->
                <p><%out.print(prod_descrip_arr[i]);%></p>
                <!--<p><% //out.print(re.getString("prod_description"));%></p>-->
                <p><%out.print(prod_price_arr[i]);%></p>
                <!--<p><% //out.print(re.getString("prod_price").toString());%></p>-->
                <button id="but<%=i + 1%>" class="add-to-cart">Add to Cart</button>
            </div>
            
        </main>

        <%i++;}%>
        
        <script>
  let addToCartButtons = document.querySelectorAll(".add-to-cart");

  addToCartButtons.forEach((button, index) => {
    button.addEventListener("click", () => {
      let xhr = new XMLHttpRequest();
      xhr.open("POST", "Inserttocard");
      xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      xhr.onreadystatechange = function() {
        if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
          if (this.responseText === "success") {
            alert("Inserted into database!");
          } else {
            alert("Insert failed");
          }
        }
      };
      xhr.send(`prod_id=${index+1}&prod_price=${prod_price_arr[index]}&cardp_quantity=1`);
    });
  });
</script>

    </body>
</html>
