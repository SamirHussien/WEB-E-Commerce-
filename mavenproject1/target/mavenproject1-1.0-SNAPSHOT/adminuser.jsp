<%-- 
    Document   : admin
    Created on : Mar 30, 2023, 12:13:30 PM
    Author     : aisha
--%>

<%@page import="com.iti.ConnectToDataBase"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.util.logging.Logger" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.util.logging.Level" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Dashboard - NiceAdmin Bootstrap Template</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="assetsAdmin/img/favicon.png" rel="icon">
    <link href="assetsAdmin/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
          rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="assetsAdmin/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assetsAdmin/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <!--  <link href="assetsAdmin/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">-->
    <!--  <link href="assetsAdmin/vendor/quill/quill.snow.css" rel="stylesheet">-->
    <!--  <link href="assetsAdmin/vendor/quill/quill.bubble.css" rel="stylesheet">-->
    <!--  <link href="assetsAdmin/vendor/remixicon/remixicon.css" rel="stylesheet">-->
    <link href="assetsAdmin/vendor/simple-datatables/style.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="assetsAdmin/css/style.css" rel="stylesheet">

    <!-- =======================================================
    * Template Name: NiceAdmin
    * Updated: Mar 09 2023 with Bootstrap v5.2.3
    * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
    * Author: BootstrapMade.com
    * License: https://bootstrapmade.com/license/
    ======================================================== -->
    <style>
        /* Style the search form */
        form {
            display: flex;
            align-items: center;
            margin-bottom: 1rem;
        }

        #search-input {
            padding: 0.5rem;
            margin-right: 0.5rem;
            border: 1px solid #ccc;
            border-radius: 0.25rem;
        }

        #search-button {
            padding: 0.5rem;
            border: none;
            background-color: #007bff;
            color: #fff;
            border-radius: 0.25rem;
            cursor: pointer;
        }

        /* Style the highlighted rows */
        .highlight {
            background-color: #66CCFF;
        }

    </style>
</head>

<body>

<main id="main" class="main">

    <div class="pagetitle">
        <span class="d-none d-md-block dropdown-toggle ps-2">Admin1</span>
        <h1>Admin Dashboard</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                <li class="breadcrumb-item active">Users</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
        <div class="row">

            <!-- Left side columns -->
            <div class="col-lg-8">
                <div class="row">

                    <!-- Sales Card -->
                    <div class="col-xxl-4 col-md-6">
                        <div class="card info-card sales-card">

                            <div class="filter">
                                <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                    <li class="dropdown-header text-start">
                                        <h6>Filter</h6>
                                    </li>

                                    <li><a class="dropdown-item" href="#">Today</a></li>
                                    <li><a class="dropdown-item" href="#">This Month</a></li>
                                    <li><a class="dropdown-item" href="#">This Year</a></li>
                                </ul>
                            </div>

                            <div class="card-body">
                                <h5 class="card-title">Sales <span>| Today</span></h5>

                                <div class="d-flex align-items-center">
                                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                        <i class="bi bi-cart"></i>
                                    </div>
                                    <div class="ps-3">
                                        <h6>145</h6>
                                        <span class="text-success small pt-1 fw-bold">12%</span> <span
                                            class="text-muted small pt-2 ps-1">increase</span>

                                    </div>
                                </div>
                            </div>

                        </div>
                    </div><!-- End Sales Card -->

                    <!-- Revenue Card -->
                    <div class="col-xxl-4 col-md-6">
                        <div class="card info-card revenue-card">

                            <div class="filter">
                                <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                    <li class="dropdown-header text-start">
                                        <h6>Filter</h6>
                                    </li>

                                    <li><a class="dropdown-item" href="#">Today</a></li>
                                    <li><a class="dropdown-item" href="#">This Month</a></li>
                                    <li><a class="dropdown-item" href="#">This Year</a></li>
                                </ul>
                            </div>

                            <div class="card-body">
                                <h5 class="card-title">Revenue <span>| This Month</span></h5>

                                <div class="d-flex align-items-center">
                                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                        <i class="bi bi-currency-dollar"></i>
                                    </div>
                                    <div class="ps-3">
                                        <h6>$3,264</h6>
                                        <span class="text-success small pt-1 fw-bold">8%</span> <span
                                            class="text-muted small pt-2 ps-1">increase</span>

                                    </div>
                                </div>
                            </div>

                        </div>
                    </div><!-- End Revenue Card -->

                    <!-- Customers Card -->
                    <div class="col-xxl-4 col-xl-12">

                        <div class="card info-card customers-card">

                            <div class="filter">
                                <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                    <li class="dropdown-header text-start">
                                        <h6>Filter</h6>
                                    </li>

                                    <li><a class="dropdown-item" href="#">Today</a></li>
                                    <li><a class="dropdown-item" href="#">This Month</a></li>
                                    <li><a class="dropdown-item" href="#">This Year</a></li>
                                </ul>
                            </div>

                            <div class="card-body">
                                <h5 class="card-title">Customers <span>| This Year</span></h5>
                                <%int sumUsers; %>

                                <div class="d-flex align-items-center">
                                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                        <i class="bi bi-people"></i>
                                    </div>
                                    <div class="ps-3">
                                        <h6>4</h6>
                                        <span class="text-danger small pt-1 fw-bold">12%</span> <span
                                            class="text-muted small pt-2 ps-1">decrease</span>

                                    </div>
                                </div>

                            </div>
                        </div>

                    </div><!-- End Customers Card -->

                    <!-- Reports -->
                    <div class="col-12">
                        <div class="card">

                            <div class="filter">
                                <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                    <li class="dropdown-header text-start">
                                        <h6>Filter</h6>
                                    </li>

                                    <li><a class="dropdown-item" href="#">Today</a></li>
                                    <li><a class="dropdown-item" href="#">This Month</a></li>
                                    <li><a class="dropdown-item" href="#">This Year</a></li>
                                </ul>
                            </div>

                            <div class="card-body">
                                <h5 class="card-title">Reports <span>/Today</span></h5>

                                <!-- Line Chart -->
                        </div>
                    </div><!-- End Reports -->

                    <!-- Recent Sales -->
                    <div class="col-12">
                        <div class="card recent-sales overflow-auto">

                            <div class="filter">
                                <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                    <li class="dropdown-header text-start">
                                        <h6>Filter</h6>
                                    </li>

                                    <li><a class="dropdown-item" href="#">Today</a></li>
                                    <li><a class="dropdown-item" href="#">This Month</a></li>
                                    <li><a class="dropdown-item" href="#">This Year</a></li>
                                </ul>
                            </div>

                            <div class="card-body">
                                <h5 class="card-title">Users <span>| Today</span></h5>

                                <div class="search-bar">

                                    <form>
                                        <input type="text" id="search-input" placeholder="Enter name">
                                        <button type="submit" id="search-button">Search</button>
                                    </form>

                                </div><!-- End Search Bar -->
                                <table class="table table-borderless datatable">
                                    <thead>
                                        <%

                                        try {
//                                            DriverManager.registerDriver(new org.postgresql.Driver());
                                            Connection con = new ConnectToDataBase().getconnection();
//                                            DriverManager.getConnection("jdbc:postgresql://localhost:5432/e-commerce",
//                                                    "postgres",
//                                                    "123456");
////                                                      Statement stmt5 = con.createStatement();
//                                            String selecttt = "SELECT count(id) from users where group_type='user'";
//                                            ResultSet rss = stmt5.executeQuery(selecttt);
//                                             sumUsers=rss.getInt("count");
                                            Statement stmt = con.createStatement();
                                            String select = "select * from users";
                                            ResultSet rs = stmt.executeQuery(select);

                                    %>


                                    <tr>
                                        <th scope="col">Name</th>
                                        <th scope="col">Address</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Phone</th>
                                        <th scope="col">Interests</th>
                                        <th scope="col">Credit Limit</th>
                                        <!--                        <th scope="col">User </th>-->
                                    </tr>
                                    </thead>
                                    <%

                                        for (int i = 1; rs.next(); i++) {


                                    %>
                                    <tbody>
                                    <tr class="data-row" data-id=i>

                                        <td><%=rs.getString("name")%>
                                        </td>
                                        <td><%=rs.getString("address")%>
                                        </td>
                                        <td><%=rs.getString("email")%>
                                        </td>
                                        <td><%=rs.getString("msisdn")%>
                                        </td>
                                        <td><%=rs.getString("interest")%>
                                        </td>
                                        <td><%=rs.getString("credit_limit")
                                        %>
                                        </td>

                                        <td>
                                            <!--                                                        <form action="DelUser.jsp" method="post">
                                                            <input  type="hidden" id="UID" name="UID" value="<%=rs.getInt(1)%>">
                                                            <input type="submit" value="Delete" class="btn btn-danger">
                                                        </form>-->
                                            <form action="" method="post">
                                                <input type="hidden" name="action" value="delete">
                                                <input type="hidden" name="deleteUserId" value="<%=rs.getInt("id")%>">
                                                <input type="submit" value="Delete" class="btn btn-danger">
                                            </form>
                                        </td>
                                        <%

                                            String action = request.getParameter("action");
                                            if (action != null && action.equals("delete")) {
                                                String userId = request.getParameter("deleteUserId");
                                                try {
                                                    // Establish a connection to the Postgres database


                                                    // Delete related records from other tables
                                                    String sql1 = "DELETE FROM prod WHERE user_id=?";
                                                    PreparedStatement statement1 = con.prepareStatement(sql1);
                                                    statement1.setInt(1, Integer.parseInt(userId));
                                                    statement1.executeUpdate();

                                                    String sql2 = "DELETE FROM card WHERE user_id=?";
                                                    PreparedStatement statement2 = con.prepareStatement(sql2);
                                                    statement2.setInt(1, Integer.parseInt(userId));
                                                    statement2.executeUpdate();

                                                    // Delete the user from the users table
                                                    String sql = "DELETE FROM users WHERE id=?";
                                                    PreparedStatement statement = con.prepareStatement(sql);
                                                    statement.setInt(1, Integer.parseInt(userId));
                                                    int rowsDeleted = statement.executeUpdate();

                                                    // Check if the user was deleted successfully
                                                    if (rowsDeleted > 0) {

                                        %>
                                        <!--                                            <p>User deleted successfully.</p>-->
                                        <script> window.alert("User Deleted seuccessfully");
                                        setTimeout(function () {
                                            location.reload();
                                        }, 2000);
                                        </script>

                                        <%
                                        } else if (rowsDeleted == 0 && action.equals("delete")) {

                                        %>
                                        <!--                <p>Error deleting user.</p>-->
                                        <%
                                            }

                                            // Close the database connection
                                            con.close();
                                        } catch (Exception e) {
                                            // Handle any errors that may occur
                                            e.printStackTrace();
                                        %>
                                        <!--            <p>Error deleting user.</p>-->
                                        <%
                                                }
                                            }
                                        %>


                                    </tr>
                                    </tbody>


                                    <% }
                                    %></table>
                                <%

                                        stmt.close();
                                        con.close();

                                    } catch (SQLException ex) {
                                        Logger.getLogger(Registration.class.getName()).log(Level.SEVERE, null, ex);
                                    }
                                %>


                            </div>

                        </div>

                    </div><!-- End Recent Sales -->

                    <script>


                        // Get the search input and button elements
                        const searchInput = document.getElementById("search-input");
                        const searchButton = document.getElementById("search-button");
                        // Add an event listener to the search button
                        searchButton.addEventListener("click", function (event) {
                            event.preventDefault(); // prevent the form from submitting
                            const searchTerm = searchInput.value.toLowerCase(); // get the search term
                            const rows = document.querySelectorAll(".data-row"); // get all the table rows

                            // Loop through the rows to find matches
                            rows.forEach(function (row) {
                                const name = row.querySelector("td:nth-child(1)").textContent.toLowerCase(); // get the name from the row
                                if (name.includes(searchTerm)) {
                                    row.classList.add("highlight"); // add a CSS class to highlight the row
                                } else {
                                    row.classList.remove("highlight"); // remove the CSS class if it's not a match
                                }
                            });
                        });</script>

                </div>
    </section>

</main><!-- End #main -->
<script>
    // Get the search input and button elements
    const searchInput = document.getElementById("search-input");
    const searchButton = document.getElementById("search-button");
    // Add an event listener to the search button
    searchButton.addEventListener("click", function (event) {
        event.preventDefault(); // prevent the form from submitting
        const searchTerm = searchInput.value.toLowerCase(); // get the search term
        const rows = document.querySelectorAll(".data-row"); // get all the table rows

        // Loop through the rows to find matches
        rows.forEach(function (row) {
            const name = row.querySelector("td:nth-child(2)").textContent.toLowerCase(); // get the name from the row
            if (name.includes(searchTerm)) {
                row.classList.add("highlight"); // add a CSS class to highlight the row
            } else {
                row.classList.remove("highlight"); // remove the CSS class if it's not a match
            }
        });
    });</script>

<!-- ======= Footer ======= -->
<footer id="footer" class="footer">
    <div class="copyright">
        &copy; Copyright <strong><span>NiceAdmin</span></strong>. All Rights Reserved
    </div>
    <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
    </div>
</footer><!-- End Footer -->

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
        class="bi bi-arrow-up-short"></i></a>

<!-- Vendor JS Files -->
<!--  <script src="assetsAdmin/vendor/apexcharts/apexcharts.min.js"></script>-->
<!--  <script src="assetsAdmin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>-->
<!--  <script src="assetsAdmin/vendor/chart.js/chart.umd.js"></script>-->
<!--  <script src="assetsAdmin/vendor/echarts/echarts.min.js"></script>-->
<!--  <script src="assetsAdmin/vendor/quill/quill.min.js"></script>-->
<script src="assetsAdmin/vendor/simple-datatables/simple-datatables.js"></script>
<!--  <script src="assetsAdmin/vendor/tinymce/tinymce.min.js"></script>-->
<!--  <script src="assetsAdmin/vendor/php-email-form/validate.js"></script>-->

<!-- Template Main JS File -->
<script src="assetsAdmin/js/main.js"></script>

</body>

</html>