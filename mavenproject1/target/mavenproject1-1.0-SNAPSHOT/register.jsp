<%-- 
    Document   : register
    Created on : Mar 28, 2023, 9:01:44 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register form</title>
    </head>
    <body>
        <form action="Validition" method="POST">
            username: <input name="username" type="text" required><br>

            birthday: <input name="birthday" type="date" ><br>

            email: <input name="email" type="email" required><br>

            password: <input name="pass" type="password" required><br>

            Job: <input name="jop" type="text"><br>

            Credit_limit: <input name="cedit_limit" type="number"><br>

            Address: <input name="address" type="text" required><br>

            Interest: <input name="interest" type="text"><br>

            <!--Phone_number: <input name="phone_number" type="tel" required><br>-->

            <!--<p>enter your phone to validate  </p><br>-->
            Phone_number: <input name="phone_number" type="tel" required><br>
            <p>Select your channel:</p>
            <div>
                <input
                    type="radio"
                    name="channel"
                    id="channel-sms"
                    value="sms"
                    checked
                    />
                <label for="channel-sms">SMS</label>
            </div>

            <div>
                <input
                    type="radio"
                    name="channel"
                    id="channel-call"
                    value="call"
                    />
                <label for="channel-call">Call</label>
            </div>
            <br>
            <input type="submit" value="Get a one-time passcode" />

            <!--<input type="submit" value="submit">-->
        </form>

        <%
//        String username=request.getParameter("username");
//        String pass=request.getParameter("pass");
//        String email=request.getParameter("email");
//        String job=request.getParameter("job");
//        String birthday=request.getParameter("birthday");
//        String address=request.getParameter("address");
//        String interest=request.getParameter("interest");
//        String phone_number=request.getParameter("Phone_number");
//        int card_lmit=Integer.parseInt(request.getParameter("cedit_limit"));
//        HttpSession newsesession=request.getSession(true);
        
        
        
        %>
    </body>
</html>
