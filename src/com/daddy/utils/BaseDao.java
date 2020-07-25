package com.daddy.utils;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BaseDao implements AutoCloseable {
    private Connection con = null;

    public <T> List<T> querySome(String sql, Class<T> clazz, Object... args) {
        PreparedStatement state = null;
        ResultSet rs = null;
        List<T> list = new ArrayList<T>();
        try {
            con = DBUtil.getSqlConnection();
            state = con.prepareStatement(sql);
            if (args.length != 0) {
                for (int i = 0; i < args.length; i++) {
                    state.setObject(i + 1, args[i]);
                }
            }
            rs = state.executeQuery();
            while (rs.next()) {
                T t = clazz.newInstance();
                savetoInstance(clazz, rs, t);
                list.add(t);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeAll(state, rs);
        }
        return list;
    }

    public <T> T queryOne(String sql, Class<T> clazz, Object... args) {
        PreparedStatement state = null;
        ResultSet rs = null;
        T t = null;
        try {
            con = DBUtil.getSqlConnection();
            state = con.prepareStatement(sql);
            if (args.length != 0) {
                for (int i = 0; i < args.length; i++) {
                    state.setObject(i + 1, args[i]);
                }
            }
            rs = state.executeQuery();
            t = clazz.newInstance();
            while (rs.next()) {
                savetoInstance(clazz, rs, t);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeAll(state, rs);
        }
        return t;
    }

    public <T> void savetoInstance(Class<T> clazz, ResultSet rs, T t) throws SQLException, NoSuchMethodException, SecurityException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        Field[] fieldArr = clazz.getDeclaredFields();
        for (Field field : fieldArr) {
            String fieldName = field.getName();
            Object fieldValue = rs.getObject(fieldName);
            if (fieldValue != null) {
                String setMethodName = getMethodName(fieldName);
                if (setMethodName.equals("setCost")) {
                    fieldValue = Double.parseDouble(String.valueOf(fieldValue));
                }
                if (setMethodName.equals("setPrice")) {
                    fieldValue = Double.parseDouble(String.valueOf(fieldValue));
                }
                if (setMethodName.equals("setSum")) {
                    fieldValue = Double.parseDouble(String.valueOf(fieldValue));
                }
                if (setMethodName.equals("setFmoney")) {
                    fieldValue = Double.parseDouble(String.valueOf(fieldValue));
                }
                Method me = clazz.getDeclaredMethod(setMethodName, field.getType());
                me.invoke(t, fieldValue);
            }
        }
    }

    public String getMethodName(String fieldName) {
        StringBuilder sb = new StringBuilder("set");
        sb.append(String.valueOf(fieldName.charAt(0)).toUpperCase());
        sb.append(fieldName.substring(1));
        return sb.toString();
    }

    public boolean inUpDel(String sql, Object... args) {
        PreparedStatement state = null;
        con = DBUtil.getSqlConnection();
        try {
            state = con.prepareStatement(sql);
            if (args.length != 0) {
                for (int i = 0; i < args.length; i++) {
                    state.setObject(i + 1, args[i]);
                }
            }
            int b = state.executeUpdate();
            return b > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeAll(state);
        }
        return false;
    }

    @Override
    public void close() throws Exception {
        if (con != null) {
            DBUtil.closeAll(con);
        }
    }

}
