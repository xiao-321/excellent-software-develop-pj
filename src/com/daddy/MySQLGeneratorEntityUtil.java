package com.daddy;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.*;


public class MySQLGeneratorEntityUtil {
    //表名
    private String tableName;
    //列名数组
    private String[] colNames;
    //列名类型数组
    private String[] colTypes;
    //列名大小数组
    private int[] colSizes;
    //列名注释
    private Map colNamesComment = new HashMap();
    //是否需要导入包java.util.*
    private boolean needUtil = true;
    //是否需要导入包java.sql.*
    private boolean needSql = false;
    //是否需要导入包java.math.BigDecimal
    private boolean needBigDecimal = false;
    //是否创建EntityHelper
    private boolean needEntityHelper = false;
    //格式化日期时间
    private static final SimpleDateFormat SDF = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    // 数据库操作
    private static final String SQL = "SELECT * FROM ";
    // 数据库配置信息
    private static final String URL = "jdbc:mysql://129.211.106.53:3306/daddy?useUnicode=true&characterEncoding=utf8&&serverTimezone=UTC";
    private static final String NAME = "root";
    private static final String PASS = "nscg0201";
    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";

    //指定实体生成所在包的路径
    private static String basePath = new File("").getAbsolutePath();
    //指定包名
    private static String packageEntityOutPath = "com.daddy.entity";

    //指定包名
    private static String packageDaoOutPath = "com.daddy.dao";
    private static String packageDaoImplOutPath = "com.daddy.dao.impl";

    private static String packageServiceOutPath = "com.daddy.service";
    private static String packageServiceimpleOutPath = "com.daddy.service.impl";

    //作者名字
    private String authorName = "PX";
    //指定需要生成的表的表名，全部生成设置为null
    private String[] generateTables = null;
    //主键
    private static String pk;

    private MySQLGeneratorEntityUtil() {
    }

    /**
     * 功能：获取并创建实体所在的路径目录
     */
    private static String pkgEntityDirName() {
        String dirName = basePath + "/src/" + packageEntityOutPath.replace(".", "/");
        File dir = new File(dirName);

        if (!dir.exists()) {
            dir.mkdirs();
            System.out.println("mkdirs dir [" + dirName + "]");
        }
        return dirName;
    }

    /**
     * 功能：获取并创建实体所在的路径目录
     */
    private static String pkgDaoImplDirName() {
        String dirName = basePath + "/src/" + packageDaoImplOutPath.replace(".", "/");
        File dir = new File(dirName);

        if (!dir.exists()) {
            dir.mkdirs();
            System.out.println("mkdirs dir [" + dirName + "]");
        }
        return dirName;
    }

    /**
     * 功能：获取并创建实体所在的路径目录
     */
    private static String pkgDaoDirName() {
        String dirName = basePath + "/src/" + packageDaoOutPath.replace(".", "/");
        File dir = new File(dirName);

        if (!dir.exists()) {
            dir.mkdirs();
            System.out.println("mkdirs dir [" + dirName + "]");
        }
        return dirName;
    }

    /**
     * 功能：获取并创建实体所在的路径目录
     */
    private static String pkgServiceDirName() {
        String dirName = basePath + "/src/" + packageServiceOutPath.replace(".", "/");
        File dir = new File(dirName);

        if (!dir.exists()) {
            dir.mkdirs();
            System.out.println("mkdirs dir [" + dirName + "]");
        }
        return dirName;
    }

    /**
     * 功能：获取并创建实体所在的路径目录
     */
    private static String pkgServiceImplDirName() {
        String dirName = basePath + "/src/" + packageServiceimpleOutPath.replace(".", "/");
        File dir = new File(dirName);

        if (!dir.exists()) {
            dir.mkdirs();
            System.out.println("mkdirs dir [" + dirName + "]");
        }
        return dirName;
    }

    /**
     * @description 生成class的所有内容
     */
    private String makeEntity() {
        StringBuffer sb = new StringBuffer();
        sb.append("package ").append(packageEntityOutPath).append(";\r\n");
        sb.append("\r\n");
        // 判断是否导入工具包
        if (needUtil) {
            sb.append("import java.util.Date;\r\n");
        }
        if (needSql) {
            sb.append("import java.sql.*;\r\n");
        }

        for (int i = 0; i < colNames.length; i++) {
            String hasbd = sqlType2JavaType(colTypes[i]);
            if (hasbd == "BigDecimal" || "BigDecimal".equals(hasbd)) {
                needBigDecimal = true;
            }
        }
        if (needBigDecimal) {
            sb.append("import java.math.BigDecimal;\r\n");
        }
        // 注释部分
        sb.append("\r\n");
        sb.append("/**\r\n");
        sb.append(" * table name:  ").append(tableName).append("\r\n");
        sb.append(" * author name: ").append(authorName).append("\r\n");
        sb.append(" * create time: ").append(SDF.format(new Date())).append("\r\n");
        sb.append(" */ \r\n\r\n");
        // 实体部分
        String classExtends = "";
        if (needEntityHelper) {
            classExtends = " extends EntityHelper";
        }
        sb.append("public class ").append(under2camel(tableName, true)).append(classExtends).append("{ \r\n\r\n");

        processAllAttrs(sb);// 属性
        sb.append("\r\n");
        processConstructor(sb);//构造函数
        processAllMethod(sb);// get set方法
        processToString(sb);
        if (needEntityHelper) {
            processEntityHelper(sb, pk);
        }
        sb.append("}\r\n");
        return sb.toString();
    }


    /**
     * @description 生成class的所有内容
     */
    private String makeDao() {
        StringBuilder sb = new StringBuilder();
        //包路径
        sb.append("package ").append(packageDaoOutPath).append(";\r\n");
        sb.append("\r\n");
        // 判断是否导入工具包
        sb.append("import com.daddy.entity.").append(under2camel(tableName, true)).append(";\r\n");
        sb.append("\r\n");
        sb.append("import java.util.List;\r\n");
        sb.append("\r\n");

        // 注释部分
        sb.append("\r\n");
        sb.append("/**\r\n");
        sb.append(" * table name:  ").append(tableName).append("\r\n");
        sb.append(" * author name: ").append(authorName).append("\r\n");
        sb.append(" * create time: ").append(SDF.format(new Date())).append("\r\n");
        sb.append(" */ \r\n\r\n");

        // 实体部分
        String classExtends = "";
        if (needEntityHelper) {
            classExtends = " ";
        }
        //主体
        sb.append("public interface ").append(under2camel(tableName, true)).append("Dao").append(" {\r\n\r\n");
        sb.append("}\r\n");
        return sb.toString();
    }

    /**
     * @description 生成class的所有内容
     */
    private String makeDaoImpl() {
        StringBuilder sb = new StringBuilder();
        //包路径
        sb.append("package ").append(packageDaoImplOutPath).append(";\r\n");
        sb.append("\r\n");
        // 判断是否导入工具包
        sb.append("import com.daddy.entity.").append(under2camel(tableName, true)).append(";\r\n");
        sb.append("import com.daddy.dao.").append(under2camel(tableName, true)).append("Dao;\r\n");
        sb.append("import com.daddy.util.BaseDao;\r\n");
        sb.append("\r\n");
        sb.append("import java.util.List;\r\n");

        // 注释部分
        sb.append("\r\n");
        sb.append("/**\r\n");
        sb.append(" * table name:  ").append(tableName).append("\r\n");
        sb.append(" * author name: ").append(authorName).append("\r\n");
        sb.append(" * create time: ").append(SDF.format(new Date())).append("\r\n");
        sb.append(" */ \r\n\r\n");
        // 实体部分
        String classExtends = "implements " + under2camel(tableName, true) + "Dao";
        //主体
        sb.append("public class ").append(under2camel(tableName, true)).append("DaoImpl ").append(classExtends).append(" {\r\n");
        sb.append("\tprivate BaseDao baseDao = new BaseDao();\r\n\r\n");
        sb.append("}\r\n");
        return sb.toString();
    }

    /**
     * @description 生成class的所有内容
     */
    private String makeService() {
        StringBuilder sb = new StringBuilder();
        //包路径
        sb.append("package ").append(packageServiceOutPath).append(";\r\n");
        sb.append("\r\n");
        // 判断是否导入工具包
        sb.append("import com.daddy.entity.").append(under2camel(tableName, true)).append(";\r\n");
        sb.append("\r\n");
        sb.append("import java.util.List;\r\n");
        // 注释部分
        sb.append("\r\n");
        sb.append("/**\r\n");
        sb.append(" * table name:  ").append(tableName).append("\r\n");
        sb.append(" * author name: ").append(authorName).append("\r\n");
        sb.append(" * create time: ").append(SDF.format(new Date())).append("\r\n");
        sb.append(" */ \r\n\r\n");
        // 实体部分
        String classExtends = "";
        if (needEntityHelper) {
            classExtends = " extends EntityHelper";
        }
        //主体
        sb.append("public interface ").append(under2camel(tableName, true)).append("Service").append(" {\r\n\r\n");
        sb.append("}\r\n");
        return sb.toString();
    }

    /**
     * @description 生成class的所有内容
     */
    private String makeServiceImpl() {
        StringBuilder sb = new StringBuilder();
        //包路径
        sb.append("package ").append(packageServiceimpleOutPath).append(";\r\n");
        sb.append("\r\n");
        // 导入工具包
        sb.append("import com.daddy.entity.").append(under2camel(tableName, true)).append(";\r\n");
        sb.append("import com.daddy.service.").append(under2camel(tableName, true)).append("Service;\r\n");
        sb.append("import com.daddy.dao.").append(under2camel(tableName, true)).append("Dao;\r\n");
        sb.append("import com.daddy.dao.impl.").append(under2camel(tableName, true)).append("DaoImpl;\r\n");
        sb.append("\r\n");
        sb.append("import java.util.List;\r\n");
        // 注释部分
        sb.append("\r\n");
        sb.append("/**\r\n");
        sb.append(" * table name:  ").append(tableName).append("\r\n");
        sb.append(" * author name: ").append(authorName).append("\r\n");
        sb.append(" * create time: ").append(SDF.format(new Date())).append("\r\n");
        sb.append(" */ \r\n\r\n");
        // 实体部分
        String classExtends = "";
        classExtends = "implements " + under2camel(tableName, true) + "Service";
        //主体
        sb.append("public class ").append(under2camel(tableName, true)).append("ServiceImpl ").append(classExtends).append(" {\r\n");
        sb.append("\tprivate ").append(under2camel(tableName, true)).append("Dao ").append(tableName).append("Dao = new ").append(under2camel(tableName, true)).append("DaoImpl();\r\n\r\n");
        sb.append("}\r\n");
        return sb.toString();
    }

    /**
     * @param sb
     * @description 生成所有成员变量及注释
     * @author paul
     * @version V1.0
     */
    private void processAllAttrs(StringBuffer sb) {
        for (int i = 0; i < colNames.length; i++) {
            if (colNamesComment.get(colNames[i]) != null && !"".equals(colNamesComment.get(colNames[i]))) {
                sb.append("\t/*").append(colNamesComment.get(colNames[i])).append("*/\r\n");
            }
            sb.append("\tprivate ").append(sqlType2JavaType(colTypes[i])).append(" ").append(colNames[i]).append(";\r\n");
        }
    }

    /**
     * EntityHelper
     *
     * @param sb
     * @param pk
     */
    private void processEntityHelper(StringBuffer sb, String pk) {
        sb.append("\t@Override\r\n");
        sb.append("\tpublic String getPrimaryKey() {\r\n");
        sb.append("\t\treturn \"").append(pk).append("\";\r\n");
        sb.append("\t}\r\n");
    }

    /**
     * 重写toString()方法
     *
     * @param sb
     */
    private void processToString(StringBuffer sb) {
        sb.append("\t@Override\r\n\tpublic String toString() {\r\n");
        sb.append("\t\treturn \"").append(tableName).append("[\" + \r\n");
        for (int i = 0; i < colNames.length; i++) {
            if (i != 0)
                sb.append("\t\t\t\", ");
            if (i == 0)
                sb.append("\t\t\t\"");
            sb.append(colNames[i]).append("=\" + ").append(colNames[i]).append(" + \r\n");
            if (i == colNames.length - 1) {
                sb.append("\t\t\t\"]\";\r\n");
            }
        }
        sb.append("\t}\r\n");
    }

    /**
     * 构造函数
     *
     * @param sb
     */
    private void processConstructor(StringBuffer sb) {
        StringBuilder p = new StringBuilder();
        StringBuilder v = new StringBuilder();
        for (int i = 0; i < colNames.length; i++) {
            p.append(sqlType2JavaType(colTypes[i])).append(" ").append(colNames[i]);
            if (i != colNames.length - 1) {
                p.append(",");
            }
            v.append("\t\tthis.").append(colNames[i]).append("=").append(colNames[i]).append(";\r\n");
        }
        //无参数构造函数
        sb.append("\tpublic ").append(under2camel(tableName, true)).append("() {\r\n");
        sb.append("\t\tsuper();\r\n");
        sb.append("\t}\r\n");
        //带参构造函数
        sb.append("\tpublic ").append(under2camel(tableName, true)).append("(").append(p.toString()).append(") {\r\n");
        sb.append(v.toString());
        sb.append("\t}\r\n");
    }

    /**
     * @param sb
     * @description 生成所有get/set方法
     */
    private void processAllMethod(StringBuffer sb) {
        for (int i = 0; i < colNames.length; i++) {
            sb.append("\tpublic void set").append(initCap(colNames[i])).append("(").append(sqlType2JavaType(colTypes[i])).append(" ").append(colNames[i]).append("){\r\n");
            sb.append("\t\tthis.").append(colNames[i]).append("=").append(colNames[i]).append(";\r\n");
            sb.append("\t}\r\n");
            sb.append("\tpublic ").append(sqlType2JavaType(colTypes[i])).append(" get").append(initCap(colNames[i])).append("(){\r\n");
            sb.append("\t\treturn ").append(colNames[i]).append(";\r\n");
            sb.append("\t}\r\n");
        }
    }

    /**
     * @param str 传入字符串
     * @return
     * @description 将传入字符串的首字母转成大写
     */
    private String initCap(String str) {
        char[] ch = str.toCharArray();
        if (ch[0] >= 'a' && ch[0] <= 'z')
            ch[0] = (char) (ch[0] - 32);
        return new String(ch);
    }

    /**
     * 功能：下划线命名转驼峰命名
     *
     * @param s
     * @param fistCharToUpperCase 首字母是否大写
     */
    private String under2camel(String s, boolean fistCharToUpperCase) {
        String separator = "_";
        StringBuilder under = new StringBuilder();
        s = s.toLowerCase().replace(separator, " ");
        String[] sarr = s.split(" ");
        for (String value : sarr) {
            String w = value.substring(0, 1).toUpperCase() + value.substring(1);
            under.append(w);
        }
        if (!fistCharToUpperCase) {
            under = new StringBuilder(under.substring(0, 1).toLowerCase() + under.substring(1));
        }
        return under.toString();
    }

    /**
     * @description 查找sql字段类型所对应的Java类型
     */
    private String sqlType2JavaType(String sqlType) {
        if (sqlType.equalsIgnoreCase("bit")) {
            return "boolean";
        } else if (sqlType.equalsIgnoreCase("TINYINT")) {
            return "byte";
        } else if (sqlType.equalsIgnoreCase("smallint")) {
            return "short";
        } else if (sqlType.equalsIgnoreCase("int")) {
            return "int";
        } else if (sqlType.equalsIgnoreCase("INTEGER")) {
            return "long";
        } else if (sqlType.equalsIgnoreCase("bigint")) {
            return "long";
        } else if (sqlType.equalsIgnoreCase("float") || sqlType.equalsIgnoreCase("FLOAT UNSIGNED")) {
            return "float";
        } else if (sqlType.equalsIgnoreCase("numeric")
                || sqlType.equalsIgnoreCase("real") || sqlType.equalsIgnoreCase("money")
                || sqlType.equalsIgnoreCase("smallmoney")) {
            return "double";
        } else if (sqlType.equalsIgnoreCase("varchar") || sqlType.equalsIgnoreCase("char")
                || sqlType.equalsIgnoreCase("nvarchar") || sqlType.equalsIgnoreCase("nchar")
                || sqlType.equalsIgnoreCase("text") || sqlType.equalsIgnoreCase("longtext")) {
            return "String";
        } else if (sqlType.equalsIgnoreCase("datetime")) {
            return "Date";
        } else if (sqlType.equalsIgnoreCase("image")) {
            return "Blod";
        } else if (sqlType.equalsIgnoreCase("decimal")) {
            return "BigDecimal";
        } else if (sqlType.equalsIgnoreCase("INT UNSIGNED")) {
            return "Integer";
        } else if (sqlType.equalsIgnoreCase("MEDIUMINT UNSIGNED")) {
            return "Integer";
        } else if (sqlType.equalsIgnoreCase("BLOB")) {
            return "byte[]";
        } else if (sqlType.equalsIgnoreCase("INTEGER UNSIGNED")) {
            return "Long";
        } else if (sqlType.equalsIgnoreCase("TINYINT UNSIGNED")) {
            return "Integer";
        } else if (sqlType.equalsIgnoreCase("SMALLINT UNSIGNED")) {
            return "Integer";
        } else if (sqlType.equalsIgnoreCase("BIGINT UNSIGNED")) {
            return "BigInteger";
        } else if (sqlType.equalsIgnoreCase("DECIMAL UNSIGNED")) {
            return "BigDecimal";
        } else if (sqlType.equalsIgnoreCase("TIMESTAMP")) {
            return "Timestamp";
        } else if (sqlType.equalsIgnoreCase("MEDIUMTEXT")) {
            return "String";
        } else if (sqlType.equalsIgnoreCase("DATE")) {
            return "Date";
        }
        System.out.println("null ===" + sqlType);
        return null;
    }

    /**
     * 生成EntityHelper
     */
    private void EntityHelper() {
        String dirName = MySQLGeneratorEntityUtil.pkgEntityDirName();
        String javaPath = dirName + "/EntityHelper.java";
        try {
            StringBuffer sb = new StringBuffer();
            sb.append("package ").append(packageEntityOutPath).append(";\r\n");
            sb.append("\r\n");
            sb.append("public abstract class EntityHelper{\r\n\r\n");
            sb.append("\tpublic abstract String getPrimaryKey();\r\n");
            sb.append("\r\n");
            sb.append("}\r\n");
            FileWriter fw = new FileWriter(javaPath);
            PrintWriter pw = new PrintWriter(fw);
            pw.println(sb.toString());
            pw.flush();
            pw.close();
            System.out.println("create class [EntityHelper]");
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    /**
     * @description 生成方法
     */
    private void generate() throws Exception {
        //与数据库的连接
        Connection con;
        PreparedStatement pStemt = null;
        Class.forName(DRIVER);
        con = DriverManager.getConnection(URL, NAME, PASS);
        System.out.println("connect database success..." + con);
        //获取数据库的元数据
        DatabaseMetaData db = con.getMetaData();
        //是否有指定生成表，有指定则直接用指定表，没有则全表生成
        List<String> tableNames = new ArrayList<>();
        if (generateTables == null) {
            //从元数据中获取到所有的表名
            ResultSet rsTables = db.getTables(null, null, "%", null);
            while (rsTables.next()) {
                //得到表名
                String tablename = rsTables.getString(3);
                tableNames.add(rsTables.getString(3));
            }
        } else {
            tableNames.addAll(Arrays.asList(generateTables));
        }
        if (needEntityHelper) {
            EntityHelper();
        }
        String tableSql;
        PrintWriter pw = null;
        for (String name : tableNames) {
            tableName = name;
            tableSql = SQL + tableName;
            pStemt = con.prepareStatement(tableSql);
            System.err.println(pStemt.getMetaData());
            ResultSetMetaData rsmd = pStemt.getMetaData();
            ResultSet rsk = con.getMetaData().getPrimaryKeys(con.getCatalog().toLowerCase(), null, tableName);
            if (rsk.next()) {
                pk = rsk.getString("COLUMN_NAME");
            }
            int size = rsmd.getColumnCount();
            colNames = new String[size];
            colTypes = new String[size];
            colSizes = new int[size];
            //获取所需的信息
            for (int i = 0; i < size; i++) {
                colNames[i] = rsmd.getColumnName(i + 1);
                colTypes[i] = rsmd.getColumnTypeName(i + 1);
                if (colTypes[i].equalsIgnoreCase("datetime"))
                    needUtil = true;
                if (colTypes[i].equalsIgnoreCase("image") || colTypes[i].equalsIgnoreCase("text"))
                    needSql = true;
                colSizes[i] = rsmd.getColumnDisplaySize(i + 1);
            }
            //获取字段注释
            ResultSet rsComment = pStemt.executeQuery("show full columns from " + tableName);
            while (rsComment.next()) {
                colNamesComment.put(rsComment.getString("Field"), rsComment.getString("Comment"));
            }
            //解析生成实体java文件的所有内容
            String content = makeEntity();
            //输出生成文件
            String dirName = MySQLGeneratorEntityUtil.pkgEntityDirName();
            String javaPath = dirName + "/" + under2camel(tableName, true) + ".java";
            FileWriter fw = new FileWriter(javaPath);
            pw = new PrintWriter(fw);
            pw.println(content);
            pw.flush();

            ///dao
            String daoContent = makeDao();
            String dirDaoName = MySQLGeneratorEntityUtil.pkgDaoDirName();
            String javadaoPath = dirDaoName + "/" + under2camel(tableName, true) + "Dao.java";
            FileWriter fwdao = new FileWriter(javadaoPath);
            pw = new PrintWriter(fwdao);
            pw.println(daoContent);
            pw.flush();
            ///daoImpl
            String daoImplContent = makeDaoImpl();
            String dirDaoImplName = MySQLGeneratorEntityUtil.pkgDaoImplDirName();
            String javaDaoImplPath = dirDaoImplName + "/" + under2camel(tableName, true) + "DaoImpl.java";
            FileWriter fwDaoimpl = new FileWriter(javaDaoImplPath);
            pw = new PrintWriter(fwDaoimpl);
            pw.println(daoImplContent);
            pw.flush();

            ///service
            String serviceContent = makeService();
            String dirServiceName = MySQLGeneratorEntityUtil.pkgServiceDirName();
            String javaServicePath = dirServiceName + "/" + under2camel(tableName, true) + "Service.java";
            FileWriter fwService = new FileWriter(javaServicePath);
            pw = new PrintWriter(fwService);
            pw.println(serviceContent);
            pw.flush();

            ///serviceImpl
            String serviceImplContent = makeServiceImpl();
            String dirServiceImplName = MySQLGeneratorEntityUtil.pkgServiceImplDirName();
            String javaServiceImplPath = dirServiceImplName + "/" + under2camel(tableName, true) + "ServiceImpl.java";
            FileWriter fwServiceimpl = new FileWriter(javaServiceImplPath);
            pw = new PrintWriter(fwServiceimpl);
            pw.println(serviceImplContent);
            pw.flush();

            System.out.println("create class [" + tableName + "]");
        }
        if (pw != null)
            pw.close();
    }

    public static void main(String[] args) {
        MySQLGeneratorEntityUtil instance = new MySQLGeneratorEntityUtil();
        //instance.basePath=""; //指定生成的位置,默认是当前工程
        try {
            instance.generate();
            System.out.println("generate Entity to classes successful!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}