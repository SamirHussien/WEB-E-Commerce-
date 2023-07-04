/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlat;

import com.iti.ConnectToDataBase;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hp
 */
public class Inserttocard extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        String prodId = req.getParameter("prod_id");
        String prodPrice = req.getParameter("prod_price");
        String cardpQuantity = req.getParameter("cardp_quantity");

        Connection con1 = new ConnectToDataBase().getconnection();
        Statement st1;
        try {
            st1 = con1.createStatement();
            String sql_insertincart = "INSERT INTO cart (user_id, prod_id, sum_price, cardp_quantity) VALUES (1, " + prodId + ", " + prodPrice + ", " + cardpQuantity + ")";
            int result = st1.executeUpdate(sql_insertincart);
            if (result > 0) {
                out.write("success");
            } else {
                out.write("failed");}
             st1.close();
            con1.close();
            }catch (SQLException ex) {
            Logger.getLogger(Inserttocard.class.getName()).log(Level.SEVERE, null, ex);
        }

        }

    }


