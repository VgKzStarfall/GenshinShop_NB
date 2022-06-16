package Database;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.SQLException;
import java.sql.DriverManager;

public class Database {

    public Connection getConnection() throws SQLException, ClassNotFoundException {
        String url="jdbc:sqlserver://"+serverName+"\\"+instance+":"+portNumber+";databaseName="+dbName;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(url,username,password);
    }
    
    private final String serverName="localhost";
    private final String portNumber="1433";
    private final String dbName="SWP";
    private final String instance="LAPTOP-QQNU666L";
    private final String username="username";
    private final String password="giahuy1612";
}
