package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
//gengxin
//new
public class DBUtil {
    private static final String URL = "jdbc:mysql://localhost:3306/web?useSSL=false&serverTimezone=Asia/Shanghai";
    private static final String USER = "root";
    private static final String PWD  = "123456";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("MySQL 驱动加载失败", e);
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PWD);
    }
}
