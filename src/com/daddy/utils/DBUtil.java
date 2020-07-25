package com.daddy.utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {
    private static Connection con = null;
    public static synchronized  Connection getSqlConnection(){
        try{
            if(con==null){
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://121.42.51.148:3306/javaxs_11?useUnicode=true&characterEncoding=utf8&&serverTimezone=UTC","user11","pass11");
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
