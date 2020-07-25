package com.daddy.utils;

import com.eltima.components.ui.DatePicker;
import com.exchange.entity.*;

import java.awt.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

public class Utils {
    public static String[][] listToStringArrays_Student(List<Student> list) {
        String[][] s2 = new String[list.size()][6];
        for (int i = 0; i < list.size(); i++) {
            Student dt = list.get(i);
            for (int j = 0; j < 6; j++) {
                if (j == 0) {
                    s2[i][j] = String.valueOf(dt.getSid());
                } else if (j == 1) {
                    s2[i][j] = dt.getSnum();
                } else if (j == 2) {
                    s2[i][j] = dt.getSname();
                } else if (j == 3) {
                    s2[i][j] = dt.getSpass();
                } else if (j == 4) {
                    s2[i][j] = dt.getSsex();
                } else {
                    s2[i][j] = Utils.dateToString(dt.getSdate());
                }
            }
        }
        return s2;
    }
    public static String[][] listToStringArrays_Passport(List<Passport> list) {
        String[][] s2 = new String[list.size()][4];
        for (int i = 0; i < list.size(); i++) {
            Passport dt = list.get(i);
            for (int j = 0; j < 4; j++) {
                if (j == 0) {
                    s2[i][j] = String.valueOf(dt.getPpid());
                } else if (j == 1) {
                    s2[i][j] = dt.getPpname();
                } else if (j == 2) {
                    s2[i][j] = String.valueOf(dt.getSid());
                } else {
                    s2[i][j] = dt.getPpstatus();
                }
            }
        }
        return s2;
    }
    public static String[][] listToStringArrays_Leaveword(List<Leaveword> list) {
        String[][] s2 = new String[list.size()][5];
        for (int i = 0; i < list.size(); i++) {
            Leaveword dt = list.get(i);
            for (int j = 0; j < 5; j++) {
                if (j == 0) {
                    s2[i][j] = String.valueOf(dt.getLwid());
                } else if (j == 1) {
                    s2[i][j] = dt.getLwtest();
                } else if (j == 2) {
                    s2[i][j] = Utils.dateToString(dt.getLwdate());
                } else if (j == 3) {
                    s2[i][j] = dt.getUname();
                } else {
                    s2[i][j] = dt.getLwreply();
                }
            }
        }
        return s2;
    }
    public static String[][] listToStringArrays_Deal(List<Deal> list) {
        String[][] s2 = new String[list.size()][5];
        for (int i = 0; i < list.size(); i++) {
            Deal dt = list.get(i);
            for (int j = 0; j < 5; j++) {
                if (j == 0) {
                    s2[i][j] = String.valueOf(dt.getDid());
                } else if (j == 1) {
                    s2[i][j] = dt.getDname();
                } else if (j == 2) {
                    s2[i][j] = dt.getDtext();
                }  else if (j == 3) {
                    s2[i][j] = Utils.dateToString(dt.getDdate());
                } else {
                    s2[i][j] = dt.getVname();
                }
            }
        }
        return s2;
    }
    public static String[][] listToStringArrays_Meeting(List<Meeting> list) {
        String[][] s2 = new String[list.size()][4];
        for (int i = 0; i < list.size(); i++) {
            Meeting dt = list.get(i);
            for (int j = 0; j < 4; j++) {
                if (j == 0) {
                    s2[i][j] = String.valueOf(dt.getMid());
                } else if (j == 1) {
                    s2[i][j] = dt.getMname();
                } else if (j == 2) {
                    s2[i][j] = dt.getMtext();
                } else {
                    s2[i][j] = Utils.dateToString(dt.getMdate());
                }
            }
        }
        return s2;
    }
    public static String[][] listToStringArrays_Visit(List<Visit> list) {
        String[][] s2 = new String[list.size()][4];
        for (int i = 0; i < list.size(); i++) {
            Visit dt = list.get(i);
            for (int j = 0; j < 4; j++) {
                if (j == 0) {
                    s2[i][j] = String.valueOf(dt.getVid());
                } else if (j == 1) {
                    s2[i][j] = dt.getVname();
                } else if (j == 2) {
                    s2[i][j] = dt.getVtext();
                } else {
                    s2[i][j] = Utils.dateToString(dt.getVdate());
                }
            }
        }
        return s2;
    }
    public static String[][] listToStringArrays_Group(List<Groupplans> list) {
        String[] gtypeList = {"出国", "港澳", "台湾"};
        String[][] s2 = new String[list.size()][3];
        for (int i = 0; i < list.size(); i++) {
            Groupplans dt = list.get(i);
            for (int j = 0; j < 3; j++) {
                if (j == 0) {
                    s2[i][j] = String.valueOf(dt.getGid());
                } else if (j == 1) {
                    s2[i][j] = dt.getGname();
                } else {
                    s2[i][j] = gtypeList[(int) dt.getGtype()];
                }
            }
        }
        return s2;
    }
    //"项目编号", "团组编号", "项目名称","出访国家", "项目费用", "开始时间","结束时间", "允许自费"
    public static String[][] listToStringArrays_Project(List<Project> list) {
        String[][] s2 = new String[list.size()][8];
        for (int i = 0; i < list.size(); i++) {
            Project dt = list.get(i);
            for (int j = 0; j < 8; j++) {
                if (j == 0) {
                    s2[i][j] = String.valueOf(dt.getPid());
                } else if (j == 1) {
                    s2[i][j] = String.valueOf(dt.getGid());
                } else if (j == 2) {
                    s2[i][j] = dt.getPtitle();
                } else if (j == 3) {
                    s2[i][j] = dt.getPcountry();
                } else if (j == 4) {
                    s2[i][j] = String.valueOf(dt.getPmoney());
                } else if (j == 5) {
                    s2[i][j] = Utils.dateToString(dt.getPstart());
                } else if (j == 6) {
                    s2[i][j] = Utils.dateToString(dt.getPend());
                } else {
                    s2[i][j] = dt.getPpay();
                }
            }
        }
        return s2;
    }
    //"申报编号", "项目编号", "项目名称","学生编号","学生姓名", "申报时间", "申报状态"
    public static String[][] listToStringArrays_Requisition(List<Requisition> list) {
        String[][] s2 = new String[list.size()][7];
        for (int i = 0; i < list.size(); i++) {
            Requisition dt = list.get(i);
            for (int j = 0; j < 7; j++) {
                if (j == 0) {
                    s2[i][j] = String.valueOf(dt.getRid());
                } else if (j == 1) {
                    s2[i][j] = String.valueOf(dt.getPid());
                } else if (j == 2) {
                    s2[i][j] = dt.getPtitle();
                } else if (j == 3) {
                    s2[i][j] = String.valueOf(dt.getSid());
                } else if (j == 4) {
                    s2[i][j] = String.valueOf(dt.getSname());
                } else if (j == 5) {
                    s2[i][j] = Utils.dateToString(dt.getRdate());
                }  else {
                    s2[i][j] = dt.getRstate();
                }
            }
        }
        return s2;
    }

    public static String dateToString(Date date) {
        //格式化日期时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(date);
    }

    public static Date parse(String strDate) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            return sdf.parse(strDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static DatePicker getDatePicker(Date date) {
        final DatePicker datepick;
        // 格式
        String DefaultFormat = "yyyy-MM-dd";
        // 当前时间
//        Date date = new Date();
        // 字体
        Font font = new Font("华文新魏", Font.BOLD, 16);

        Dimension dimension = new Dimension(177, 24);

        int[] hilightDays = {1, 3, 5, 7};

        int[] disabledDays = {4, 6, 5, 9};
        //构造方法（初始时间，时间显示格式，字体，控件大小）
        datepick = new DatePicker(date, DefaultFormat, font, dimension);

        datepick.setLocation(137, 83);//设置起始位置
        /*
        //也可用setBounds()直接设置大小与位置
        datepick.setBounds(137, 83, 177, 24);
        */
        // 设置一个月份中需要高亮显示的日子
//        datepick.setHightlightdays(hilightDays, Color.red);
        // 设置一个月份中不需要的日子，呈灰色显示
//        datepick.setDisableddays(disabledDays);
        // 设置国家
        datepick.setLocale(Locale.CANADA);
        // 设置时钟面板可见
        datepick.setTimePanleVisible(false);
        return datepick;
    }
}
