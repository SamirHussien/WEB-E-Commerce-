/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.iti;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author hp
 */
public class ConnectToDataBase {
    
    public Connection getconnection(){
        Connection connect =null;
        try{
        Class.forName("org.postgresql.Driver");
        connect = DriverManager.getConnection("jdbc:postgresql://localhost:5432/e_commerce", "postgres", "samir123456789");
        System.out.println("connected");
    
//        return connect;
        }catch(Exception e){
            System.out.println("connection faild");
            e.printStackTrace();
        }
        return connect;
    }
    
}
