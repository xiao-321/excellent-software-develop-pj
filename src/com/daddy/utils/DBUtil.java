package com.daddy.utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {
    private static Connection con = null;
    public static synchronized  Connection getSqlConnection(){
        try{
            if(con==null){
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://129.211.106.53:3306/daddy?useUnicode=true&characterEncoding=utf8&serverTimezone=UTC","root","nscg0201");
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return con;
    }
    public static void closeAll(AutoCloseable... autoCloseable){
        for (AutoCloseable closeable : autoCloseable) {
            try {
                closeable.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
