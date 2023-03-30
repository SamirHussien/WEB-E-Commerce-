/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlat;

import com.iti.ConnectToDataBase;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.twilio.Twilio;
import com.twilio.exception.ApiException;
import com.twilio.rest.verify.v2.service.Verification;
import com.twilio.rest.verify.v2.service.VerificationCheck;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
/**
 *
 * @author hp
 */
public class Validition extends HttpServlet {
//    public static final String ACCOUNT_SID = System.getenv("ACad569270fd5b3a0d7155928c85eba62d");
//    public static final String AUTH_TOKEN = System.getenv("a006194bf6991f45fc980999925e6a30");

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//       resp.setContentType("text/html");
       PrintWriter out =resp.getWriter();
//       out.println("<div>\n" +
//"                  <p>Enter the code:</p>\n" +
//"                  <input type=\"text\" id=\"code\" placeholder=\"123456\" required />\n" +
//"                </div>\n" +
//"                <div>\n" +
//"                  <input type=\"submit\" value=\"Verify code\" />\n" +
//"                </div>");
//   Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
        String username=req.getParameter("username");
        String pass=req.getParameter("pass");
        String email=req.getParameter("email");
        String job=req.getParameter("jop");
        String birthday=req.getParameter("birthday");
        String address=req.getParameter("address");
        String interest=req.getParameter("interest");
        String phone_number=req.getParameter("phone_number");
        float card_lmit=Float.parseFloat(req.getParameter("cedit_limit"));
//        int phone=Integer.parseInt(phone_number);
        out.println(username+":user \t "+pass+":pass\t "+email+":em\t "+job+":j\t "+birthday+":birt\t "+address+":add\t "+interest+":inte\t "+"+2"+phone_number+":phone \t "+card_lmit);
        HttpSession newsesession=req.getSession(true);
//        phone_number="+2".concat(phone_number);
       try{
//           Date birdate=(Date) new SimpleDateFormat("dd/MM/yyyy").parse(birthday);  
//           Verification verification = Verification.creator(
//                "VAbd3b6cb6e38b5e9588dd684de21ee97f",
//                  "+2".concat(phone_number) ,
////                "+201153709707",
//                "sms")
//                
//            .create();
//
//        System.out.println(verification.getStatus());
//        out.println("connect2");
//////        step 3
////        VerificationCheck verificationCheck = VerificationCheck.creator(
////                "VAbd3b6cb6e38b5e9588dd684de21ee97f")
////            .setTo("+201153709707")
////            .setCode("862310")
////            .create();
////
////        System.out.println(verificationCheck.getStatus());
////           out.println("connect3");
////        
           Connection con =new ConnectToDataBase().getconnection();
           String sql="insert into users(name,password,address,email,msisdn,credit_limit,interest,barthdate,group_type) values "
                   + "('"+username+"','"+pass+"','"+address+"','"+email+"','"+phone_number+"',"+card_lmit+",'"+interest+"','"+birthday+"','user');";
                   Statement st=con.createStatement();
                   Integer rs= st.executeUpdate(sql);
                   if(rs==1){
                       System.out.println("register success");
                       resp.sendRedirect("LoginPage.jsp");
                   
                   }else{
                   out.println("mesh ant ya hapypy");
                   }
                   
                   
        
           
//       }catch(final ApiException e) {
//            System.err.println(e);
       } catch (SQLException ex) {
           out.println("error while insert");
            Logger.getLogger(Validition.class.getName()).log(Level.SEVERE, null, ex);
       }
    
       
       
    }

    

}
